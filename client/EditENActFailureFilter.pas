
unit EditENActFailureFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActFailureController ;

type
  TfrmENActFailureFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateAct : TLabel;
    edtDateAct: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENActFailure: THTTPRIO;

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
  frmENActFailureFilterEdit: TfrmENActFailureFilterEdit;
  ENActFailureFilterObj: ENActFailureFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActFailureController  ;
}
{$R *.dfm}



procedure TfrmENActFailureFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateAct
      ,edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENActFailureObj.numberGen; 



      if ENActFailureObj.dateAct <> nil then
      begin
        edtDateAct.DateTime:=EncodeDate(ENActFailureObj.dateAct.Year,ENActFailureObj.dateAct.Month,ENActFailureObj.dateAct.Day);
        edtDateAct.checked := true;
      end
      else
      begin
        edtDateAct.DateTime:=SysUtils.Date;
        edtDateAct.checked := false;
      end;	  



    MakeMultiline(edtCommentGen.Lines, ENActFailureObj.commentGen);



    edtUserAdd.Text := ENActFailureObj.userAdd; 



      if ENActFailureObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENActFailureObj.dateAdd.Year,ENActFailureObj.dateAdd.Month,ENActFailureObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENActFailureObj.userGen; 



      if ENActFailureObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENActFailureObj.dateEdit.Year,ENActFailureObj.dateEdit.Month,ENActFailureObj.dateEdit.Day);
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



procedure TfrmENActFailureFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActFailure: ENActFailureControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActFailureFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateAct.checked then
     begin 
       if ENActFailureFilterObj.dateAct = nil then
          ENActFailureFilterObj.dateAct := TXSDateTime.Create;
       ENActFailureFilterObj.dateAct.XSToNative(GetXSDate(edtdateAct.DateTime));
     end
     else
       ENActFailureFilterObj.dateAct := nil;



     ENActFailureFilterObj.commentGen := edtCommentGen.Text; 



     ENActFailureFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENActFailureFilterObj.dateAdd = nil then
          ENActFailureFilterObj.dateAdd := TXSDateTime.Create;
       ENActFailureFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENActFailureFilterObj.dateAdd := nil;



     ENActFailureFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENActFailureFilterObj.dateEdit = nil then
          ENActFailureFilterObj.dateEdit := TXSDateTime.Create;
       ENActFailureFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENActFailureFilterObj.dateEdit := nil;




  end;
end;




end.