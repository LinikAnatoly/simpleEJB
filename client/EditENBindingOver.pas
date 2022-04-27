
unit EditENBindingOver;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBindingOverController ;

type
  TfrmENBindingOverEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblItemText : TLabel;
    edtItemText: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENBindingOverOrganizationOrganizationName : TLabel;
  edtENBindingOverOrganizationOrganizationName : TEdit;
  spbENBindingOverOrganizationOrganization : TSpeedButton;
  

  HTTPRIOENBindingOver: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENBindingOverOrganizationOrganizationClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBindingOverEdit: TfrmENBindingOverEdit;
  ENBindingOverObj: ENBindingOver;

implementation

uses
  ShowENBindingOverOrganization
  ,ENBindingOverOrganizationController
;

{uses  
    EnergyproController, EnergyproController2, ENBindingOverController  ;
}
{$R *.dfm}



procedure TfrmENBindingOverEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENBindingOverOrganizationOrganizationName
      ,spbENBindingOverOrganizationOrganization
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtItemText
      ,edtENBindingOverOrganizationOrganizationName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBindingOverObj.code);
    edtNumberGen.Text := ENBindingOverObj.numberGen; 
      if ENBindingOverObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENBindingOverObj.dateGen.Year,ENBindingOverObj.dateGen.Month,ENBindingOverObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtItemText.Text := ENBindingOverObj.itemText; 
    MakeMultiline(edtCommentGen.Lines, ENBindingOverObj.commentGen);
    edtUserGen.Text := ENBindingOverObj.userGen; 
      if ENBindingOverObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENBindingOverObj.dateEdit.Year,ENBindingOverObj.dateEdit.Month,ENBindingOverObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENBindingOverOrganizationOrganizationName.Text := ENBindingOverObj.organization.name;

  end;
end;



procedure TfrmENBindingOverEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBindingOver: ENBindingOverControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtItemText
      ,edtENBindingOverOrganizationOrganizationName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBindingOver := HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;


     ENBindingOverObj.numberGen := edtNumberGen.Text; 

     if edtdateGen.checked then
     begin 
       if ENBindingOverObj.dateGen = nil then
          ENBindingOverObj.dateGen := TXSDate.Create;
       ENBindingOverObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENBindingOverObj.dateGen := nil;

     ENBindingOverObj.itemText := edtItemText.Text; 

     ENBindingOverObj.commentGen := edtCommentGen.Text; 

     ENBindingOverObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENBindingOverObj.dateEdit = nil then
          ENBindingOverObj.dateEdit := TXSDate.Create;
       ENBindingOverObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENBindingOverObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENBindingOverObj.code:=low(Integer);
      TempENBindingOver.add(ENBindingOverObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBindingOver.save(ENBindingOverObj);
    end;
  end;
end;


procedure TfrmENBindingOverEdit.spbENBindingOverOrganizationOrganizationClick(Sender : TObject);
var 
   frmENBindingOverOrganizationShow: TfrmENBindingOverOrganizationShow;
begin
   frmENBindingOverOrganizationShow:=TfrmENBindingOverOrganizationShow.Create(Application,fmNormal);
   try
      with frmENBindingOverOrganizationShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBindingOverObj.organization = nil then ENBindingOverObj.organization := ENBindingOverOrganization.Create();
               ENBindingOverObj.organization.code := StrToInt(GetReturnValue(sgENBindingOverOrganization,0));
               edtENBindingOverOrganizationOrganizationName.Text:=GetReturnValue(sgENBindingOverOrganization,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBindingOverOrganizationShow.Free;
   end;
end;



end.