import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit} from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
@Component({
  selector: 'app-edit-form',
  templateUrl: './edit-form.component.html',
  styleUrls: ['./edit-form.component.css']
})
export class EditFormComponent implements OnInit {
  editBBQForm: FormGroup;
  @Input() name : any ;  
  http: HttpClient;
  serverData!: any ;
  url!: string;
  done_edit : boolean ;
  new_name : string ; curr_name : string ; 
  constructor(fb: FormBuilder, http: HttpClient) {
    this.http = http;
    this.serverData = null;
    this.editBBQForm = fb.group(
      {'name': ['', Validators.required ]}
    );
    this.done_edit = false ; 
    this.new_name ="";
    this.curr_name = "" ; 
  }
  ngOnInit(): void {
  }

  onSubmit(data:any){
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/name/"+this.curr_name+"/new/"+data.name;
    this.http.put<any>(this.url,"").
    subscribe({next: (res) => {this.serverData = res;},
    error: (res) => {this.serverData = "Server call failed: " + res;}});
    this.done_edit = true ; 
    this.new_name = data.name ;
    this.curr_name = data.name ; 
  }


}
