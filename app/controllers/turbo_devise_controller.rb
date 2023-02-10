class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream # to handle turbo stream format
      if @default_response
        @default_response.call(options.merge(formats: :html))
      else
        controller.render(options.merge(formats: :html))
        # tell the responder to render with html format & no need to look for turbo stream template
      end
    rescue ActionView::MissingTemplate => error # handle the case when no template being found
      if get? # if it's get request, just reraise the error
        raise error
      elsif has_errors? && default_action
      # has_errors?: for html, js, json responses. tell the responder to treat as html request  (responders gem)
      # default_action: { post: :new, patch/put: :edit } (responders gem)
        if respond_to?(:error_rendering_options, true)
          # For responders 3.1.0 or higher
          render error_rendering_options.merge(formats: :html, status: :unprocessable_entity)
        else
          render rendering_options.merge(formats: :html, status: :unprocessable_entity)
          # add formats & status value to the rendering options
        end
      else
        navigation_behavior error # redirect to index page
      end
    end
  end

  self.responder = Responder # assign Responder class written above to be the responder
  respond_to :html, :turbo_stream # tell the responder which formats we want to respond with
end