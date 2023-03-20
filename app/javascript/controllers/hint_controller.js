import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
    static targets = [ "category", "reason" ]
    static values = {
        url: String,
        param: String
    }

    showHint() {
        let params = new URLSearchParams()
        if (this.categoryTarget.value !== "") {
            params.append("category_id", this.categoryTarget.value)
        }
        if (this.reasonTarget.value !== "") {
            params.append("reason_id", this.reasonTarget.value)
        }
        console.log(params)
        get(`/to_let_go_items/hint?${params}`, {
            responseKind: "turbo-stream"
        })
    }
}