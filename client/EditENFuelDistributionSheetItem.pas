
unit EditENFuelDistributionSheetItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelDistributionSheetItemController ;

type
  TfrmENFuelDistributionSheetItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDecadeNumber : TLabel;
    edtDecadeNumber: TEdit;


  HTTPRIOENFuelDistributionSheetItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbSums: TGroupBox;
    lblCount1: TLabel;
    edtCount1: TEdit;
    lblCount2: TLabel;
    edtCount2: TEdit;
    edtCount3: TEdit;
    lblCount3: TLabel;
    lblCount4: TLabel;
    edtCount4: TEdit;
    lblCount5: TLabel;
    edtCount5: TEdit;
    lblCount6: TLabel;
    edtCount6: TEdit;
    lblCount7: TLabel;
    edtCount7: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
      ENFuelDistributionSheetItemObj: ENFuelDistributionSheetItem;

end;

var
  frmENFuelDistributionSheetItemEdit: TfrmENFuelDistributionSheetItemEdit;


implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelDistributionSheetItemController  ;
}
{$R *.dfm}



procedure TfrmENFuelDistributionSheetItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDecadeNumber
      ,edtCount1
      ,edtCount2
      ,edtCount3
      ,edtCount4
      ,edtCount5
      ,edtCount6
      ,edtCount7
     ]);
   end;

   DisableControls([edtCode, edtDecadeNumber]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFuelDistributionSheetItemObj.code);
    if ( ENFuelDistributionSheetItemObj.decadeNumber <> Low(Integer) ) then
       edtDecadeNumber.Text := IntToStr(ENFuelDistributionSheetItemObj.decadeNumber)
    else
       edtDecadeNumber.Text := '';
    if ( ENFuelDistributionSheetItemObj.count1 <> nil ) then
       edtCount1.Text := ENFuelDistributionSheetItemObj.count1.decimalString
    else
       edtCount1.Text := '';
    if ( ENFuelDistributionSheetItemObj.count2 <> nil ) then
       edtCount2.Text := ENFuelDistributionSheetItemObj.count2.decimalString
    else
       edtCount2.Text := '';
    if ( ENFuelDistributionSheetItemObj.count3 <> nil ) then
       edtCount3.Text := ENFuelDistributionSheetItemObj.count3.decimalString
    else
       edtCount3.Text := '';
    if ( ENFuelDistributionSheetItemObj.count4 <> nil ) then
       edtCount4.Text := ENFuelDistributionSheetItemObj.count4.decimalString
    else
       edtCount4.Text := '';
    if ( ENFuelDistributionSheetItemObj.count5 <> nil ) then
       edtCount5.Text := ENFuelDistributionSheetItemObj.count5.decimalString
    else
       edtCount5.Text := '';
    if ( ENFuelDistributionSheetItemObj.count6 <> nil ) then
       edtCount6.Text := ENFuelDistributionSheetItemObj.count6.decimalString
    else
       edtCount6.Text := '';
    if ( ENFuelDistributionSheetItemObj.count7 <> nil ) then
       edtCount7.Text := ENFuelDistributionSheetItemObj.count7.decimalString
    else
       edtCount7.Text := '';
  end;
end;



procedure TfrmENFuelDistributionSheetItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelDistributionSheetItem: ENFuelDistributionSheetItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDecadeNumber
      ,edtCount1
      ,edtCount2
      ,edtCount3
      ,edtCount4
      ,edtCount5
      ,edtCount6
      ,edtCount7
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelDistributionSheetItem := HTTPRIOENFuelDistributionSheetItem as ENFuelDistributionSheetItemControllerSoapPort;


     if ( edtDecadeNumber.Text <> '' ) then
       ENFuelDistributionSheetItemObj.decadeNumber := StrToInt(edtDecadeNumber.Text)
     else
       ENFuelDistributionSheetItemObj.decadeNumber := Low(Integer) ;

     if (ENFuelDistributionSheetItemObj.count1 = nil ) then
       ENFuelDistributionSheetItemObj.count1 := TXSDecimal.Create;
     if edtCount1.Text <> '' then
       ENFuelDistributionSheetItemObj.count1.decimalString := edtCount1.Text 
     else
       ENFuelDistributionSheetItemObj.count1 := nil;

     if (ENFuelDistributionSheetItemObj.count2 = nil ) then
       ENFuelDistributionSheetItemObj.count2 := TXSDecimal.Create;
     if edtCount2.Text <> '' then
       ENFuelDistributionSheetItemObj.count2.decimalString := edtCount2.Text 
     else
       ENFuelDistributionSheetItemObj.count2 := nil;

     if (ENFuelDistributionSheetItemObj.count3 = nil ) then
       ENFuelDistributionSheetItemObj.count3 := TXSDecimal.Create;
     if edtCount3.Text <> '' then
       ENFuelDistributionSheetItemObj.count3.decimalString := edtCount3.Text 
     else
       ENFuelDistributionSheetItemObj.count3 := nil;

     if (ENFuelDistributionSheetItemObj.count4 = nil ) then
       ENFuelDistributionSheetItemObj.count4 := TXSDecimal.Create;
     if edtCount4.Text <> '' then
       ENFuelDistributionSheetItemObj.count4.decimalString := edtCount4.Text 
     else
       ENFuelDistributionSheetItemObj.count4 := nil;

     if (ENFuelDistributionSheetItemObj.count5 = nil ) then
       ENFuelDistributionSheetItemObj.count5 := TXSDecimal.Create;
     if edtCount5.Text <> '' then
       ENFuelDistributionSheetItemObj.count5.decimalString := edtCount5.Text 
     else
       ENFuelDistributionSheetItemObj.count5 := nil;
     if edtCount6.Text <> '' then
       ENFuelDistributionSheetItemObj.count6.decimalString := edtCount6.Text
     else
       ENFuelDistributionSheetItemObj.count6 := nil;
     if edtCount7.Text <> '' then
       ENFuelDistributionSheetItemObj.count7.decimalString := edtCount7.Text
     else
       ENFuelDistributionSheetItemObj.count7 := nil;

    if DialogState = dsInsert then
    begin
      ENFuelDistributionSheetItemObj.code:=low(Integer);
      TempENFuelDistributionSheetItem.add(ENFuelDistributionSheetItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelDistributionSheetItem.save(ENFuelDistributionSheetItemObj);
    end;
  end;
end;


end.