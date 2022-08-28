import { ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output, SimpleChanges } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms'; 
import { HttpClient, HttpResponse } from '@angular/common/http';
import { DataService } from '../data.service';
import $ from "jquery";
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
  selector: 'app-search-bar',
  templateUrl: './search-bar.component.html',
  styleUrls: ['./search-bar.component.css']
})
export class SearchBarComponent implements OnInit {
  @Output() searchAllEvent = new EventEmitter();
  @Output() searchByEvent = new EventEmitter();
  @Output() searchParameter = new EventEmitter();
  @Output() upload = new EventEmitter();
  @Output() openEdit = new EventEmitter();
  total_edit: number  ; 
  //The connection data
  http: HttpClient;url !: string ;
  serverData!:any; serverDataArr: Record<string, ServerData> | undefined;
  type : string ;
  //Search bar function data
  appliedBoth : boolean ; appliedName : boolean ; appliedDistrict : boolean ; 
  disableButton : boolean ;  disableEditBtn : boolean ;
  searchByForm: FormGroup;
  keyword!:string ;
  tutorialMessage:string ;
  constructor(fb:FormBuilder,http: HttpClient,private dataServe:DataService) {
    this.http = http ; 
    this.type = "";
    this.tutorialMessage="Enter any keyword to search , or apply a filter first";
    this.appliedBoth = false ; this.appliedDistrict=false ; this.appliedName=false;
    this.disableButton = true ; this.disableEditBtn = true ; 
    this.total_edit = 0 ; 
    this.searchByForm = fb.group(
      {
        'keyword': ['', Validators.required ]
      }
    );
  }

  ngOnInit(): void {
    this.dataServe.currentEditCount.subscribe(data=>{
      this.total_edit=data;
      if(data>0)this.disableEditBtn=false;
    }) ;
  }
  ngOnChanges(changes : SimpleChanges){
  }
  openEditHandler(){
    this.openEdit.emit();
  }
  searchAllButtonHandler(){
    this.resetbtnstate();
    this.tutorialMessage = "Showing all barbeque site data" ;
    this.searchAllEvent.emit();
  }
  uploadButtonHandler(){
    this.upload.emit();
  }
  //These change the search by state
  selectDistrict(){
    this.filterSwitch(true) ; 
  }
  selectName(){
    this.filterSwitch(false) ; 
  }
  //switching the filter , district : true / name : false
  filterSwitch ( district : boolean ){
    if(district){
      if(this.appliedBoth||this.appliedDistrict){
        this.tutorialMessage="disabled district filter" ; this.appliedDistrict = false ; 
        this.type = this.appliedName ? "name" : "any" ; 
      }else{
        this.tutorialMessage = "enabled district filter " ; this.appliedDistrict = true ; 
        this.type = this.appliedName ? "both" : "district";
      }
    }else{
      if(this.appliedBoth||this.appliedName){
        this.tutorialMessage = "disabled name filter" ; this.appliedName = false ; 
        this.type = this.appliedDistrict ? "district" : "any" ; 
      }else{
        this.tutorialMessage = "enabled name filter" ; this.appliedName = true ; 
        this.type = this.appliedDistrict? "both" : "name";
      }
    }
  }
  //This shall only called if user want to start the search
  onSubmit(formValue: any): void {
    let keyword = formValue.keyword ;
    let type = this.type;
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/"+type+"/"+keyword ; 
    this.http.get<any>(this.url).subscribe({
      next: (res) => {
        this.serverData = res ; 
        this.serverDataArr = JSON.parse(JSON.stringify(res));
        let sendServerData = this.serverData
        this.searchByEvent.emit(sendServerData);
        this.searchParameter.emit([type,keyword]);
        this.tutorialMessage = "showing search result of keyword "+keyword;
      }, 
      error: (err) => {
        this.serverData = "Server call failed: " + err
      }
    }); 
  }
  enteringKeyword(){
    this.tutorialMessage = "entering keyword ... " ;
    this.checkButton();
  }
  notEntering(){
    this.checkButton();
    if(this.searchByForm.controls.keyword.valid){
      this.tutorialMessage = "hit the search button to search"; 
    }else{
      this.tutorialMessage = "Start enter the keyword to search"; 
    }
  }
  checkButton(){
    this.disableButton = this.searchByForm.controls.keyword.valid ? false : true ; 
  }
  //jquery
  //toggle button not active state 
  resetbtnstate() {
    $('#btn_name').removeClass('active');$('#btn_district').removeClass('active');
  }
}
