import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    async toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content

        const response = await fetch(`/tasks/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken,
            },
            body: JSON.stringify({ completed: e.target.checked })
        })

        if (response.ok) {
            const data = await response.json()
            document.getElementById("tasks-to-be-completed").textContent = data['tasks_to_be_completed_count']
        }
    }
}