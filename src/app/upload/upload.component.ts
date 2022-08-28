import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators ,ReactiveFormsModule} from '@angular/forms'; 

@Component({
  selector: 'app-upload',
  templateUrl: './upload.component.html',
  styleUrls: ['./upload.component.css']
})
export class UploadComponent implements OnInit {
  uploadBBQForm: FormGroup;
  http: HttpClient;
  serverData!: any ;
  url!: string;
  submitted : boolean = false ; 
  uploadName : string = "";
  uploadDistrict : string = "";
  uploadAddress : string = "";
  uploadFacility: string = "";
  uploadAF : string = "";
  uploadOpenHour : string = "";
  uploadPhone : string = "";
  uploadRemark : string = "";

  constructor(fb: FormBuilder, http: HttpClient) { 
    this.http = http;
    this.serverData = null;
    this.uploadBBQForm = fb.group(
      {'name': ['', Validators.required ],
      'openHour': ['', Validators.required ],
      'facility': ['', Validators.required ],
      'phone': ['', [Validators.required,Validators.pattern("^[0-9]*$")]],
      'af': [''],
      'address': ['', Validators.required ],
      'district': ['', Validators.required ],
      'remark': ['']}
    );
  }
  ngOnInit(): void {
  }

  onSubmit (data : any){
    this.uploadName = data.name ;
    this.uploadAddress = data.address ;
    this.uploadDistrict = data.facility;
    this.uploadFacility = data.facility;
    this.uploadOpenHour = data.openHour;
    this.uploadPhone = data.phone;
    this.uploadAF = data.af;
    this.uploadRemark = data.remark;
    this.url = "http://192.168.0.3/assignment_web/index.php/facility/"+data.district
    +"/"+data.name+"/"+data.address+"/"+data.facility+"/"+data.af+"/"+data.openHour
    +"/"+data.phone+"/"+data.remark;
    this.http.post<any>(this.url,"").
    subscribe({next: (res) => {this.serverData = res;},
    error: (res) => {this.serverData = "Server call failed: " + res;}});
    this.submitted = true ; 
  }
}
