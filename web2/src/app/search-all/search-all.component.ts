import { HttpClient, HttpResponse } from '@angular/common/http';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
interface ServerData {
  District_en: string;
  Name_en: string;
  Address_en: string;
  Facilities_en: string;
  Ancillary_facilities_en: string;
  Opening_hours_en: string;
  Phone: string;
  Remarks_en: string;
}

@Component({
  selector: 'app-search-all',
  templateUrl: './search-all.component.html',
  styleUrls: ['./search-all.component.css']
})
export class SearchAllComponent implements OnInit {
  http: HttpClient;
  url!: string;
  serverData!:any;
  serverDataArr: Record<string, ServerData> | undefined;
  @Output() edit = new EventEmitter();

  constructor(http: HttpClient) { 
    this.http = http ; 
  }

  ngOnInit(): void {
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/all" ; 
    this.http.get<any>(this.url).subscribe({
      next: (res) => {
        //console.log("Server returns: " + res);
        this.serverData = res ; 
        this.serverDataArr = JSON.parse(JSON.stringify(res));
        //console.log(this.serverData);
      }, 
      error: (err) => {
        this.serverData = "Server call failed: " + err
      }
    }); 
  }
  deleteButtonHandler(name: string) {
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/name/"+name ; 
    this.http.delete<any>(this.url).subscribe({
      next: (res) => {
        //console.log("Server returns: " + res);
        this.serverData = res ; 
        this.serverDataArr = JSON.parse(JSON.stringify(res));
        //console.log(this.serverData);
      }, 
      error: (err) => {
        this.serverData = "Server call failed: " + err
      }
    }); 
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/all" ; 
    this.http.get<any>(this.url).subscribe({
      next: (res) => {
        console.log("Server returns: " + res);
        this.serverData = res ; 
        this.serverDataArr = JSON.parse(JSON.stringify(res));
        console.log(this.serverData);
      }, 
      error: (err) => {
        this.serverData = "Server call failed: " + err
      }
    }); 
  }
  editButtonHandler (name:String){
    this.edit.emit(name);
  }
}
