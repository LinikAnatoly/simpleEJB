
unit EditENActProj2OZ2;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActProj2OZ2Controller ;

type
  TfrmENActProj2OZ2Edit = class(TDialogForm)
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblSummaGen : TLabel;
    edtSummaGen: TEdit;


  HTTPRIOENActProj2OZ2: THTTPRIO;

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
  frmENActProj2OZ2Edit: TfrmENActProj2OZ2Edit;
  ENActProj2OZ2Obj: ENActProj2OZ2;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActProj2OZ2Controller  ;
}
{$R *.dfm}



procedure TfrmENActProj2OZ2Edit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtSummaGen
     ]);
   end;

   SetFloatStyle(edtSummaGen);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    
    edtNumberGen.Text := ENActProj2OZ2Obj.numberGen; 
      if ENActProj2OZ2Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENActProj2OZ2Obj.dateGen.Year,ENActProj2OZ2Obj.dateGen.Month,ENActProj2OZ2Obj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtCommentGen.Text := ENActProj2OZ2Obj.commentGen; 
    if ( ENActProj2OZ2Obj.summaGen <> nil ) then
       edtSummaGen.Text := ENActProj2OZ2Obj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 

//      if ENActProj2OZ2Obj.dateEdit <> nil then
//      begin
//        edtDateEdit.DateTime:=EncodeDate(ENActProj2OZ2Obj.dateEdit.Year,ENActProj2OZ2Obj.dateEdit.Month,ENActProj2OZ2Obj.dateEdit.Day);
//        edtDateEdit.checked := true;
//      end
//      else
//      begin
//        edtDateEdit.DateTime:=SysUtils.Date;
//        edtDateEdit.checked := false;
//      end;


  end;
end;



procedure TfrmENActProj2OZ2Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActProj2OZ2: ENActProj2OZ2ControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtSummaGen
      ,edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENActProj2OZ2 := HTTPRIOENActProj2OZ2 as ENActProj2OZ2ControllerSoapPort;


     ENActProj2OZ2Obj.numberGen := edtNumberGen.Text; 

     if edtdateGen.checked then
     begin 
       if ENActProj2OZ2Obj.dateGen = nil then
          ENActProj2OZ2Obj.dateGen := TXSDate.Create;
       ENActProj2OZ2Obj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENActProj2OZ2Obj.dateGen := nil;

     ENActProj2OZ2Obj.commentGen := edtCommentGen.Text; 

     if (ENActProj2OZ2Obj.summaGen = nil ) then
       ENActProj2OZ2Obj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActProj2OZ2Obj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActProj2OZ2Obj.summaGen := nil;

     //ENActProj2OZ2Obj.userGen := edtUserGen.Text; 

//     if edtdateEdit.checked then
//     begin 
//       if ENActProj2OZ2Obj.dateEdit = nil then
//          ENActProj2OZ2Obj.dateEdit := TXSDate.Create;
//       ENActProj2OZ2Obj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
//     end
//     else
//       ENActProj2OZ2Obj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENActProj2OZ2Obj.code:=low(Integer);
      TempENActProj2OZ2.add(ENActProj2OZ2Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActProj2OZ2.save(ENActProj2OZ2Obj);
    end;
  end;
end;


end.
