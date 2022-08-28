import { Component } from '@angular/core';
import { Subject } from "rxjs";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  editName : any ; 
  searchParameter : any ;
  searchByData : any ;
  searchAllTriggered: boolean = false;
  searchByTriggered: boolean = false;
  uploadTriggered: boolean = false;
  editTriggered: boolean = false;
  editCount: number = 0   ; 


  subject = new Subject();
  ngOnInit() {
    this.subject.subscribe(val => {
      console.log(val);
    });
    this.subject.next("1");
    this.subject.next("2");
    this.subject.complete();
  }



  editCountReceiver(data:number){
    this.editCount = data ; 
  }
  openEditReceiver(){
    this.searchAllTriggered = false ; 
    this.searchByTriggered = false ; 
    this.uploadTriggered = false ;
    this.editTriggered = true ;
  }
  uploadReceiver(){
    this.uploadTriggered = true ;
    this.searchAllTriggered = false ; 
    this.searchByTriggered = false ; 
    this.editTriggered = false ; 
  }
  searchAllEventReceiver(){
    this.searchAllTriggered = true ; 
    this.searchByTriggered = false ; 
    this.uploadTriggered = false ;
    this.editTriggered = false ; 
  }
  searchByEventReceiver(data:any){
    this.searchByData = data ;
    this.searchAllTriggered = false ; 
    this.searchByTriggered = true ; 
    this.uploadTriggered = false ;
    this.editTriggered = false ; 
  }
  searchParameterReceiver(data:any){
    this.searchParameter = data ; 
  }
  editReceiver(name:any){
    this.editName = name ;
    this.searchAllTriggered = false ; 
    this.searchByTriggered = false ; 
    this.uploadTriggered = false ;
    this.editTriggered = true ;
  }
  title = 'web2';
}
