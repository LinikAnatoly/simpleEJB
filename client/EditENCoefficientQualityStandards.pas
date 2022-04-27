
unit EditENCoefficientQualityStandards;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoefficientQualityStandardsController ;

type
  TfrmENCoefficientQualityStandardsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSumma : TLabel;
    edtSumma: TEdit;
    lblCoefficient : TLabel;
    edtCoefficient: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIOENCoefficientQualityStandards: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFinCehName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSummaChange(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCoefficientQualityStandardsEdit: TfrmENCoefficientQualityStandardsEdit;
  ENCoefficientQualityStandardsObj: ENCoefficientQualityStandards;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCoefficientQualityStandardsController  ;
}
{$R *.dfm}



procedure TfrmENCoefficientQualityStandardsEdit.FormShow(Sender: TObject);
 var
    Year, Month, Day: Word;
begin

  DisableControls([edtCode , edtCoefficient ]);

  SetFloatStyle([ edtSumma  , edtCoefficient  ]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoefficient
      ,edtDateGen
      ,edtSumma
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCoefficientQualityStandardsObj.code);
    if ( ENCoefficientQualityStandardsObj.summa <> nil ) then
       edtSumma.Text := ENCoefficientQualityStandardsObj.summa.decimalString
    else
       edtSumma.Text := '';
    if ( ENCoefficientQualityStandardsObj.coefficient <> nil ) then
       edtCoefficient.Text := ENCoefficientQualityStandardsObj.coefficient.decimalString
    else
       edtCoefficient.Text := '';
      SetDateFieldForDateTimePicker(edtDateGen, ENCoefficientQualityStandardsObj.dateGen);



  end;

  if ( DialogState = dsInsert ) then

  begin
    DecodeDate(Date, Year, Month, Day);
    // SetDateFieldForDateTimePicker(edtDateGen, GetTXSDateTimeFromTDateTimePicker( EncodeDate(Year, Month, 1) - 1 ) );
    edtDateGen.DateTime := StrToDate('1' +'.0'+ FloatTostr(Month) +'.'+ FloatTostr(Year));

  end;

end;



procedure TfrmENCoefficientQualityStandardsEdit.edtSummaChange(Sender: TObject);
var sum, koeff : Double;
begin
  try
    sum := StrToFloat(edtSumma.Text);
  except
    on EConvertError do
      sum := 0;
  end;
  if ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
   if sum <= 10000 then
   edtCoefficient.Text := '1'
   else if ((sum > 10000) and (sum <=100000)) then
   edtCoefficient.Text := '0.99'
   else if ((sum > 100000) and (sum <=500000)) then
   edtCoefficient.Text := '0.95'
   else if ((sum > 500000) and (sum <=1000000)) then
   edtCoefficient.Text := '0.90'
   else
   edtCoefficient.Text := '0';
  end;
end;

procedure TfrmENCoefficientQualityStandardsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCoefficient  ,
      edtSumma  ,
      edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCoefficientQualityStandards := HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;


     if (ENCoefficientQualityStandardsObj.summa = nil ) then
       ENCoefficientQualityStandardsObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       ENCoefficientQualityStandardsObj.summa.decimalString := edtSumma.Text 
     else
       ENCoefficientQualityStandardsObj.summa := nil;

     if (ENCoefficientQualityStandardsObj.coefficient = nil ) then
       ENCoefficientQualityStandardsObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENCoefficientQualityStandardsObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENCoefficientQualityStandardsObj.coefficient := nil;

     ENCoefficientQualityStandardsObj.dateGen := GetTXSDateTimeFromTDateTimePicker(edtdateGen);	   


    if DialogState = dsInsert then
    begin
      ENCoefficientQualityStandardsObj.code:=low(Integer);
      TempENCoefficientQualityStandards.add(ENCoefficientQualityStandardsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCoefficientQualityStandards.save(ENCoefficientQualityStandardsObj);
    end;
  end;
end;


end.