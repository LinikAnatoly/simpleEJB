
unit EditENStandardConstEntry;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandardConstEntryController ;

type
  TfrmENStandardConstEntryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblConstEntry : TLabel;
    edtConstEntry: TEdit;
    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;
    lblEndDate : TLabel;
    edtEndDate: TDateTimePicker;


  HTTPRIOENStandardConstEntry: THTTPRIO;

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
  frmENStandardConstEntryEdit: TfrmENStandardConstEntryEdit;
  ENStandardConstEntryObj: ENStandardConstEntry;

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandardConstEntryController  ;
}
{$R *.dfm}



procedure TfrmENStandardConstEntryEdit.FormShow(Sender: TObject);

begin
  SetFloatStyle([edtConstEntry]);
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtConstEntry
      ,edtStartDate
      ,edtEndDate
     ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENStandardConstEntryObj.code);
    if ( ENStandardConstEntryObj.constEntry <> nil ) then
       edtConstEntry.Text := ENStandardConstEntryObj.constEntry.decimalString
    else
       edtConstEntry.Text := '';

    if ENStandardConstEntryObj.startDate <> nil then
    begin
      edtStartDate.DateTime:=EncodeDate(ENStandardConstEntryObj.startDate.Year,ENStandardConstEntryObj.startDate.Month,ENStandardConstEntryObj.startDate.Day);
      edtStartDate.checked := true;
    end
    else
    begin
      edtStartDate.DateTime:=SysUtils.Date;
      edtStartDate.checked := false;
    end;

    if ENStandardConstEntryObj.endDate <> nil then
    begin
      edtEndDate.DateTime:=EncodeDate(ENStandardConstEntryObj.endDate.Year,ENStandardConstEntryObj.endDate.Month,ENStandardConstEntryObj.endDate.Day);
      edtEndDate.checked := true;
    end
    else
    begin
      edtEndDate.DateTime:=SysUtils.Date;
      edtEndDate.checked := false;
    end;


  end;
end;



procedure TfrmENStandardConstEntryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtConstEntry, edtStartDate, edtEndDate])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;


     if (ENStandardConstEntryObj.constEntry = nil ) then
       ENStandardConstEntryObj.constEntry := TXSDecimal.Create;
     if edtConstEntry.Text <> '' then
       ENStandardConstEntryObj.constEntry.decimalString := edtConstEntry.Text
     else
       ENStandardConstEntryObj.constEntry := nil;

     if edtstartDate.checked then
     begin 
       if ENStandardConstEntryObj.startDate = nil then
          ENStandardConstEntryObj.startDate := TXSDate.Create;
       ENStandardConstEntryObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENStandardConstEntryObj.startDate := nil;

     if edtendDate.checked then
     begin 
       if ENStandardConstEntryObj.endDate = nil then
          ENStandardConstEntryObj.endDate := TXSDate.Create;
       ENStandardConstEntryObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENStandardConstEntryObj.endDate := nil;

    if DialogState = dsInsert then
    begin
      ENStandardConstEntryObj.code:=low(Integer);
      TempENStandardConstEntry.add(ENStandardConstEntryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENStandardConstEntry.save(ENStandardConstEntryObj);
    end;
  end;
end;


end.