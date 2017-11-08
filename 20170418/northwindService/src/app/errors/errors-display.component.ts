import { Component, Input } from '@angular/core'

@Component( {
    selector : 'errors-display',
    templateUrl : './errors-display.html'
})
export class ErrorsDisplayComponent {
    @Input() errors:any
}
