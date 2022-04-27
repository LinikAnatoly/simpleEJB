
unit EditENPlanGraphFinancingFuel;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanGraphFinancingFuelController ;

type
  TfrmENPlanGraphFinancingFuelEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMonthGen : TLabel;
    lblYearGen : TLabel;
    lblTotalSum : TLabel;
    edtTotalSum: TEdit;
    lblKoefDekada1 : TLabel;
    edtKoefDekada1: TEdit;
    lblKoefDekada2 : TLabel;
    edtKoefDekada2: TEdit;
    lblKoefDekada3 : TLabel;
    edtKoefDekada3: TEdit;


  HTTPRIOENPlanGraphFinancingFuel: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    GroupBox1: TGroupBox;
    rbbezin: TRadioButton;
    rbdp: TRadioButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanGraphFinancingFuelEdit: TfrmENPlanGraphFinancingFuelEdit;
  ENPlanGraphFinancingFuelObj: ENPlanGraphFinancingFuel;

implementation

uses ENConsts, TKFuelCalcTypeController, TKFuelTypeController;


{uses  
    EnergyproController, EnergyproController2, ENPlanGraphFinancingFuelController  ;
}
{$R *.dfm}



procedure TfrmENPlanGraphFinancingFuelEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);
  SetFloatStyle([edtTotalSum]);

  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);

  if DialogState = dsView then
  begin
     DisableControls([ rbbezin , rbdp]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTotalSum
      ,edtKoefDekada1
      ,edtKoefDekada2
      ,edtKoefDekada3
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPlanGraphFinancingFuelObj.code);
//    if ( ENPlanGraphFinancingFuelObj.monthGen <> Low(Integer) ) then
//       edtMonthGen.Text := IntToStr(ENPlanGraphFinancingFuelObj.monthGen)
//    else
//       edtMonthGen.Text := '';
    if ( ENPlanGraphFinancingFuelObj.monthGen <> Low(Integer) ) then
       edtMonthGen.ItemIndex := ENPlanGraphFinancingFuelObj.monthGen - 1
    else
       edtMonthGen.ItemIndex := -1;

//    if ( ENPlanGraphFinancingFuelObj.yearGen <> Low(Integer) ) then
//       edtYearGen.Text := IntToStr(ENPlanGraphFinancingFuelObj.yearGen)
//    else
//       edtYearGen.Text := '';

    if ( ENPlanGraphFinancingFuelObj.yearGen <> Low(Integer) ) then
       edtYearGen.ItemIndex := ENPlanGraphFinancingFuelObj.yearGen - 2009
    else
       edtYearGen.ItemIndex := -1;

    if ( ENPlanGraphFinancingFuelObj.totalSum <> nil ) then
       edtTotalSum.Text := ENPlanGraphFinancingFuelObj.totalSum.decimalString
    else
       edtTotalSum.Text := ''; 
    if ( ENPlanGraphFinancingFuelObj.koefDekada1 <> nil ) then
       edtKoefDekada1.Text := ENPlanGraphFinancingFuelObj.koefDekada1.decimalString
    else
       edtKoefDekada1.Text := ''; 
    if ( ENPlanGraphFinancingFuelObj.koefDekada2 <> nil ) then
       edtKoefDekada2.Text := ENPlanGraphFinancingFuelObj.koefDekada2.decimalString
    else
       edtKoefDekada2.Text := ''; 
    if ( ENPlanGraphFinancingFuelObj.koefDekada3 <> nil ) then
       edtKoefDekada3.Text := ENPlanGraphFinancingFuelObj.koefDekada3.decimalString
    else
       edtKoefDekada3.Text := '';

    if ENPlanGraphFinancingFuelObj.fuelTypeRef <> nil then
    begin
       if ENPlanGraphFinancingFuelObj.fuelTypeRef.code = TKFUELTYPE_92 then
          rbbezin.Checked := True;
       if ENPlanGraphFinancingFuelObj.fuelTypeRef.code = TKFUELTYPE_DIESEL then
          rbdp.Checked := True;
    end;




  end;
end;



procedure TfrmENPlanGraphFinancingFuelEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTotalSum
      ,edtKoefDekada1
      ,edtKoefDekada2
      ,edtKoefDekada3
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanGraphFinancingFuel := HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;


//     if ( edtMonthGen.Text <> '' ) then
//       ENPlanGraphFinancingFuelObj.monthGen := StrToInt(edtMonthGen.Text)
//     else
//       ENPlanGraphFinancingFuelObj.monthGen := Low(Integer) ;

     if (edtMonthGen.ItemIndex >= 0) then
       ENPlanGraphFinancingFuelObj.monthGen := edtMonthGen.ItemIndex + 1
     else
       ENPlanGraphFinancingFuelObj.monthGen := Low(Integer) ;


//     if ( edtYearGen.Text <> '' ) then
//       ENPlanGraphFinancingFuelObj.yearGen := StrToInt(edtYearGen.Text)
//     else
//       ENPlanGraphFinancingFuelObj.yearGen := Low(Integer) ;

     if (edtYearGen.ItemIndex >= 0) then
       ENPlanGraphFinancingFuelObj.yearGen := edtYearGen.ItemIndex + 2009
     else
       ENPlanGraphFinancingFuelObj.yearGen := Low(Integer);

     if (ENPlanGraphFinancingFuelObj.totalSum = nil ) then
       ENPlanGraphFinancingFuelObj.totalSum := TXSDecimal.Create;
     if edtTotalSum.Text <> '' then
       ENPlanGraphFinancingFuelObj.totalSum.decimalString := edtTotalSum.Text 
     else
       ENPlanGraphFinancingFuelObj.totalSum := nil;

     if (ENPlanGraphFinancingFuelObj.koefDekada1 = nil ) then
       ENPlanGraphFinancingFuelObj.koefDekada1 := TXSDecimal.Create;
     if edtKoefDekada1.Text <> '' then
       ENPlanGraphFinancingFuelObj.koefDekada1.decimalString := edtKoefDekada1.Text 
     else
       ENPlanGraphFinancingFuelObj.koefDekada1 := nil;

     if (ENPlanGraphFinancingFuelObj.koefDekada2 = nil ) then
       ENPlanGraphFinancingFuelObj.koefDekada2 := TXSDecimal.Create;
     if edtKoefDekada2.Text <> '' then
       ENPlanGraphFinancingFuelObj.koefDekada2.decimalString := edtKoefDekada2.Text 
     else
       ENPlanGraphFinancingFuelObj.koefDekada2 := nil;

     if (ENPlanGraphFinancingFuelObj.koefDekada3 = nil ) then
       ENPlanGraphFinancingFuelObj.koefDekada3 := TXSDecimal.Create;
     if edtKoefDekada3.Text <> '' then
       ENPlanGraphFinancingFuelObj.koefDekada3.decimalString := edtKoefDekada3.Text 
     else
       ENPlanGraphFinancingFuelObj.koefDekada3 := nil;


     if ENPlanGraphFinancingFuelObj.fuelTypeRef = nil then
        ENPlanGraphFinancingFuelObj.fuelTypeRef := TKFuelTypeRef.Create();

     if(( rbbezin.Checked = false ) and ( rbdp.Checked = false )) then
       begin
        Application.MessageBox(PChar('Потрібно обрати тип палива!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
       end;

     if rbbezin.Checked then
        ENPlanGraphFinancingFuelObj.fuelTypeRef.code := TKFUELTYPE_92;
     if rbdp.Checked then
        ENPlanGraphFinancingFuelObj.fuelTypeRef.code := TKFUELTYPE_DIESEL;


    if DialogState = dsInsert then
    begin
      ENPlanGraphFinancingFuelObj.code:=low(Integer);
      TempENPlanGraphFinancingFuel.add(ENPlanGraphFinancingFuelObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanGraphFinancingFuel.save(ENPlanGraphFinancingFuelObj);
    end;
  end;
end;


end.