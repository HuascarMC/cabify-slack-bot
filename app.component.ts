import { NgModule, Component } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AgmCoreModule } from '@agm/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})


export class AppComponent implements OnInit{

 ad: string = '';
 lat: string = '';
 lng: string = '';
 error: string = '';
 api_key: string = 'AIzaSyDaWjtIBo52j7qrtJKsr7ykERqQ5MywinE';
 searchCount = 0;

  constructor(private http: HttpClient){ }
  ngOnInit(): void {
   if (this.ad != '') {

   this.http.get(
   'https://maps.googleapis.com/maps/api/geocode/json?address='
    + this.ad + '&key=' + this.api_key).subscribe(data => {

     console.log(data.status);
    if(data.status != "ZERO_RESULTS") {
      this.lat = data.results[0].geometry.location.lat;
      this.lng = data.results[0].geometry.location.lng;
      this.error = ''
      this.searchCount = this.searchCount + 1;
     } else {
      this.error = "Invalid address";
     }
    });
   }
  }
}
