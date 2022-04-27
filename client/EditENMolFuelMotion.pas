
unit EditENMolFuelMotion;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolFuelMotionController ;

type
  TfrmENMolFuelMotionEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMolcode : TLabel;
    edtMolcode: TEdit;
    lblMolname : TLabel;
    edtMolname: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblNn : TLabel;
    edtNn: TEdit;
    lblMat_name : TLabel;
    edtMat_name: TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENMolFuelMotion: THTTPRIO;

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
  frmENMolFuelMotionEdit: TfrmENMolFuelMotionEdit;
  ENMolFuelMotionObj: ENMolFuelMotion;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolFuelMotionController  ;
}
{$R *.dfm}



procedure TfrmENMolFuelMotionEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      ,edtNn
      ,edtMat_name
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENMolFuelMotionObj.code);
    edtMolcode.Text := ENMolFuelMotionObj.molcode; 
    edtMolname.Text := ENMolFuelMotionObj.molname; 
      if ENMolFuelMotionObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENMolFuelMotionObj.dateGen.Year,ENMolFuelMotionObj.dateGen.Month,ENMolFuelMotionObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtNn.Text := ENMolFuelMotionObj.nn; 
    edtMat_name.Text := ENMolFuelMotionObj.mat_name; 
    if ( ENMolFuelMotionObj.countGen <> nil ) then
       edtCountGen.Text := ENMolFuelMotionObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
    edtUserGen.Text := ENMolFuelMotionObj.userGen; 
      if ENMolFuelMotionObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENMolFuelMotionObj.dateEdit.Year,ENMolFuelMotionObj.dateEdit.Month,ENMolFuelMotionObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmENMolFuelMotionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNn
      ,edtMat_name
      ,edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMolFuelMotion := HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;


     ENMolFuelMotionObj.molcode := edtMolcode.Text; 

     ENMolFuelMotionObj.molname := edtMolname.Text; 

     if edtdateGen.checked then
     begin 
       if ENMolFuelMotionObj.dateGen = nil then
          ENMolFuelMotionObj.dateGen := TXSDate.Create;
       ENMolFuelMotionObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENMolFuelMotionObj.dateGen := nil;

     ENMolFuelMotionObj.nn := edtNn.Text; 

     ENMolFuelMotionObj.mat_name := edtMat_name.Text; 

     if (ENMolFuelMotionObj.countGen = nil ) then
       ENMolFuelMotionObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENMolFuelMotionObj.countGen.decimalString := edtCountGen.Text 
     else
       ENMolFuelMotionObj.countGen := nil;

     ENMolFuelMotionObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENMolFuelMotionObj.dateEdit = nil then
          ENMolFuelMotionObj.dateEdit := TXSDateTime.Create;
       ENMolFuelMotionObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENMolFuelMotionObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      ENMolFuelMotionObj.code:=low(Integer);
      TempENMolFuelMotion.add(ENMolFuelMotionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMolFuelMotion.save(ENMolFuelMotionObj);
    end;
  end;
end;


end.