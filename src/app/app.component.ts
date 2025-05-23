import { Component } from '@angular/core'
import { UmbrellaFooterModule } from 'umbrella-library'

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [UmbrellaFooterModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {}
