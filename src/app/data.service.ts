import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs' ;

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private editCountSource = new BehaviorSubject<number>(0);

  currentEditCount = this.editCountSource.asObservable();


  constructor(private http: HttpClient) { }


  changeEditCount(count : number){
    this.editCountSource.next(count);
    console.log(count);
  }

}
