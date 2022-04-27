
unit EditENActFailure;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActFailureController ;

type
  TfrmENActFailureEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmENActFailureEdit: TfrmENActFailureEdit;
  ENActFailureObj: ENActFailure;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActFailureController  ;
}
{$R *.dfm}



procedure TfrmENActFailureEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

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
      edtCode.Text := IntToStr(ENActFailureObj.code);
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
end;



procedure TfrmENActFailureEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActFailure: ENActFailureControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtUserAdd
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;


     ENActFailureObj.numberGen := edtNumberGen.Text; 

     if edtdateAct.checked then
     begin 
       if ENActFailureObj.dateAct = nil then
          ENActFailureObj.dateAct := TXSDateTime.Create;
       ENActFailureObj.dateAct.XSToNative(GetXSDate(edtdateAct.DateTime));
     end
     else
       ENActFailureObj.dateAct := nil;	   

     ENActFailureObj.commentGen := edtCommentGen.Text; 

     ENActFailureObj.userAdd := edtUserAdd.Text; 

     if edtdateAdd.checked then
     begin 
       if ENActFailureObj.dateAdd = nil then
          ENActFailureObj.dateAdd := TXSDateTime.Create;
       ENActFailureObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENActFailureObj.dateAdd := nil;	   

     ENActFailureObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENActFailureObj.dateEdit = nil then
          ENActFailureObj.dateEdit := TXSDateTime.Create;
       ENActFailureObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENActFailureObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      ENActFailureObj.code:=low(Integer);
      TempENActFailure.add(ENActFailureObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActFailure.save(ENActFailureObj);
    end;
  end;
end;


end.