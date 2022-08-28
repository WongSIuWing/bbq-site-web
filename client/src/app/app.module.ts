import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { SearchAllComponent } from './search-all/search-all.component';
import { SearchBarComponent } from './search-bar/search-bar.component';
import { FormGroup, FormBuilder, Validators} from '@angular/forms';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SearchByComponent } from './search-by/search-by.component';
import { UploadComponent } from './upload/upload.component';
import { EditComponent } from './edit/edit.component';
import { EditFormComponent } from './edit-form/edit-form.component';


@NgModule({
  declarations: [
    AppComponent,
    SearchAllComponent,
    SearchBarComponent,
    SearchByComponent,
    UploadComponent,
    EditComponent,
    EditFormComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule, 
    FormsModule, 
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
