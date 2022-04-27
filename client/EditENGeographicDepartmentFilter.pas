
unit EditENGeographicDepartmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGeographicDepartmentController ;

type
  TfrmENGeographicDepartmentFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCommentgen : TLabel;
    edtCommentgen: TEdit;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENGeographicDepartment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENGeographicDepartmentFilterEdit: TfrmENGeographicDepartmentFilterEdit;
  ENGeographicDepartmentFilterObj: ENGeographicDepartmentFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGeographicDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENGeographicDepartmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENGeographicDepartmentObj.name; 



    edtCommentgen.Text := ENGeographicDepartmentObj.commentgen; 



    edtUserAdd.Text := ENGeographicDepartmentObj.userAdd; 



      if ENGeographicDepartmentObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENGeographicDepartmentObj.dateAdd.Year,ENGeographicDepartmentObj.dateAdd.Month,ENGeographicDepartmentObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENGeographicDepartmentObj.userGen; 



      if ENGeographicDepartmentObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENGeographicDepartmentObj.dateEdit.Year,ENGeographicDepartmentObj.dateEdit.Month,ENGeographicDepartmentObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENGeographicDepartmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENGeographicDepartmentFilterObj.name := edtName.Text; 



     ENGeographicDepartmentFilterObj.commentgen := edtCommentgen.Text; 



     ENGeographicDepartmentFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENGeographicDepartmentFilterObj.dateAdd = nil then
          ENGeographicDepartmentFilterObj.dateAdd := TXSDateTime.Create;
       ENGeographicDepartmentFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENGeographicDepartmentFilterObj.dateAdd := nil;



     ENGeographicDepartmentFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENGeographicDepartmentFilterObj.dateEdit = nil then
          ENGeographicDepartmentFilterObj.dateEdit := TXSDateTime.Create;
       ENGeographicDepartmentFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENGeographicDepartmentFilterObj.dateEdit := nil;




  end;
end;




end.