import { Component, EventEmitter, Input, OnChanges, OnInit, Output } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
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
  selector: 'app-search-by',
  templateUrl: './search-by.component.html',
  styleUrls: ['./search-by.component.css']
})
export class SearchByComponent implements OnInit {
  @Input() searchByData: Record<string, ServerData> | undefined;
  @Input() searchParameter : Array<string> | undefined; 
  http: HttpClient;
  url !: string ;
  serverData!:any;
  @Output() edit = new EventEmitter();
  constructor(http: HttpClient) { 
    this.http = http ;
  }
  ngOnInit(): void {
  }
  //this is delete button
  deleteButtonHandler(name: string) {
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/name/"+name ; 
    this.http.delete<any>(this.url).subscribe({
      next: (res) => {
        console.log("Server returns: " + res);
        //this.serverData = res ; 
        //this.searchByData = JSON.parse(JSON.stringify(res));
        //console.log(this.serverData);
      }, 
      error: (err) => {
        this.serverData = "Server call failed: " + err
      }
    }); 
    let searchParam = ["",""];
    if(this.searchParameter?.length==2){
      searchParam [0] = this.searchParameter[0] ;
      searchParam [1] = this.searchParameter[1] ;
    }
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/"+searchParam[0]+"/"+searchParam[1] ;  ; 
    console.log(this.url);
    this.http.get<any>(this.url).subscribe({
      next: (res) => {
        console.log("Server returns: " + res);
        this.serverData = res ; 
        this.searchByData = JSON.parse(JSON.stringify(res));
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