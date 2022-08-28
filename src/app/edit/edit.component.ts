import { HttpClient } from '@angular/common/http';
import { Component, EventEmitter, Input, OnInit, Output, SimpleChange, SimpleChanges } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService  } from '../data.service' ;


@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {
  editBBQForm: FormGroup;
  @Input() name : any ; 
  @Output() send_edit_count = new EventEmitter(); 
  http: HttpClient;serverData!: any ; url!: string;
  done_edit : boolean ;
  edit_count :number ;
  edit_list : Array <string>; 
  constructor(fb: FormBuilder, http: HttpClient, private dataServe : DataService) {
    this.http = http;
    this.serverData = null;
    this.editBBQForm = fb.group(
      {'name': ['', Validators.required ]}
    );
    this.done_edit = false ; 
    this.edit_list = [];
    this.edit_count = 0 ; 
  }
  ngOnInit(): void {
  }
  //changes => currentValue: "Deep Water Bay Beach" - firstChange: false - previousValue: "Cafeteria Old Beach"
  ngOnChanges(changes: SimpleChanges){
    let name = changes.name.currentValue
    if(name!==undefined&&this.edit_list==undefined) this.edit_list = [name] ; 
    if(name!==undefined&&this.edit_list!=undefined&&!(this.edit_list.find(x=>x==name))) this.edit_list.push(name);
    this.dataServe.changeEditCount(this.edit_list.length);
  }
}
