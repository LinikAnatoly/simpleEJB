
unit EditENFuelInventarizationItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationItemController ;

type
  TfrmENFuelInventarizationItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;
    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelInventarizationItem: THTTPRIO;

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
  frmENFuelInventarizationItemEdit: TfrmENFuelInventarizationItemEdit;
  ENFuelInventarizationItemObj: ENFuelInventarizationItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationItemController  ;
}
{$R *.dfm}



procedure TfrmENFuelInventarizationItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFuelInventarizationItemObj.code);
    if ( ENFuelInventarizationItemObj.countGen <> nil ) then
       edtCountGen.Text := ENFuelInventarizationItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
    if ( ENFuelInventarizationItemObj.countFact <> nil ) then
       edtCountFact.Text := ENFuelInventarizationItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 
    edtUserAdd.Text := ENFuelInventarizationItemObj.userAdd; 
      if ENFuelInventarizationItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENFuelInventarizationItemObj.dateAdd.Year,ENFuelInventarizationItemObj.dateAdd.Month,ENFuelInventarizationItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;
    edtUserGen.Text := ENFuelInventarizationItemObj.userGen; 
      if ENFuelInventarizationItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelInventarizationItemObj.dateEdit.Year,ENFuelInventarizationItemObj.dateEdit.Month,ENFuelInventarizationItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmENFuelInventarizationItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtUserAdd
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;


     if (ENFuelInventarizationItemObj.countGen = nil ) then
       ENFuelInventarizationItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENFuelInventarizationItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENFuelInventarizationItemObj.countGen := nil;

     if (ENFuelInventarizationItemObj.countFact = nil ) then
       ENFuelInventarizationItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENFuelInventarizationItemObj.countFact.decimalString := edtCountFact.Text 
     else
       ENFuelInventarizationItemObj.countFact := nil;

     ENFuelInventarizationItemObj.userAdd := edtUserAdd.Text; 

     if edtdateAdd.checked then
     begin 
       if ENFuelInventarizationItemObj.dateAdd = nil then
          ENFuelInventarizationItemObj.dateAdd := TXSDateTime.Create;
       ENFuelInventarizationItemObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENFuelInventarizationItemObj.dateAdd := nil;	   

     ENFuelInventarizationItemObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENFuelInventarizationItemObj.dateEdit = nil then
          ENFuelInventarizationItemObj.dateEdit := TXSDateTime.Create;
       ENFuelInventarizationItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelInventarizationItemObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      ENFuelInventarizationItemObj.code:=low(Integer);
      TempENFuelInventarizationItem.add(ENFuelInventarizationItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelInventarizationItem.save(ENFuelInventarizationItemObj);
    end;
  end;
end;


end.