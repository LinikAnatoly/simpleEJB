
unit EditENPriconnectionData;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
    EnergyproController, EnergyproController2, ENPriconnectionDataController,
    AdvObj;

type
    TfrmENPriconnectionDataEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;

    HTTPRIOENPriconnectionData: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    sgENPriconnectionData: TAdvStringGrid;
    GroupBox1: TGroupBox;
    lblPowerContractProm: TLabel;
    edtPowerContractProm: TEdit;
    lblPowerContractByt: TLabel;
    edtPowerContractByt: TEdit;
    lblPowerContractTotal: TLabel;
    edtPowerContractTotal: TEdit;
    GroupBox2: TGroupBox;
    lblCountCustomer: TLabel;
    edtCountCustomer: TEdit;
    lblCountCustomerByt: TLabel;
    edtCountCustomerByt: TEdit;
    lblCountCustomerProm: TLabel;
    edtCountCustomerProm: TEdit;
    lblPowerContractTU: TLabel;
    edtPowerContractTU: TEdit;
    btnCalculate: TButton;
    btnSaveCalculate: TButton;
    GroupBox3: TGroupBox;
    lblPowerMaxCurrent: TLabel;
    lblCoeffUsage: TLabel;
    lblPowerReserveCurrent: TLabel;
    lblPriceCurrent: TLabel;
    edtPowerMaxCurrent: TEdit;
    edtCoeffUsage: TEdit;
    edtPowerReserveCurrent: TEdit;
    edtPriceCurrent: TEdit;
    GroupBox4: TGroupBox;
    lblPowerContractNewTU: TLabel;
    edtPowerContractNewTU: TEdit;
    GroupBox5: TGroupBox;
    lblPowerMaxAfterReconstr: TLabel;
    edtPowerMaxAfterReconstr: TEdit;
    lblPowerReserveAfterReconstr: TLabel;
    edtPowerReserveAfterReconstr: TEdit;
    lblPriceAfterReconstr: TLabel;
    edtPriceAfterReconstr: TEdit;
    lblPaySum: TLabel;
    edtPaySum: TEdit;
    lblT1powerCurrent: TLabel;
    edtT1powerCurrent: TEdit;
    edtT1powerNew: TEdit;
    lblT2powerCurrent: TLabel;
    edtT2powerCurrent: TEdit;
    edtT2powerNew: TEdit;
    lblT3powerCurrent: TLabel;
    edtT3powerCurrent: TEdit;
    edtT3powerNew: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblCostFactExpenses: TLabel;
    edtCostFactExpenses: TEdit;
    chbIncludeTU: TCheckBox;
    chbIncludeConnections: TCheckBox;
    chbIncludeAgreement: TCheckBox;
    edtCommentGen: TEdit;
    lblCommentGen: TLabel;
    GroupBox6: TGroupBox;
    lblCostLinesBuilding: TLabel;
    lblCostLines10Building: TLabel;
    edtCostLines04Building: TEdit;
    edtCostLines10Building: TEdit;
    GroupBox7: TGroupBox;
    lblCostLines04Building1: TLabel;
    lblCostLines10Building1: TLabel;
    lblCostLines04Building2: TLabel;
    lblCostLines10Building2: TLabel;
    lblCostLines04Building3: TLabel;
    lblCostLines10Building3: TLabel;
    edtCostLines04Building1: TEdit;
    edtCostLines10Building1: TEdit;
    edtCostLines04Building2: TEdit;
    edtCostLines10Building2: TEdit;
    edtCostLines04Building3: TEdit;
    edtCostLines10Building3: TEdit;
    lblCostTPBuilding: TLabel;
    lblCostDismantling: TLabel;
    edtCostTPBuilding: TEdit;
    edtCostDismantling: TEdit;
    lblCostTPBuildingSolidary: TLabel;
    edtCostTPBuildingSolidary: TEdit;
    lblCostDismantlingSolidary: TLabel;
    edtCostDismantlingSolidary: TEdit;
    chbWithOutReplacingTP: TCheckBox;
    lblOtherCosts: TLabel;
    edtOtherCosts: TEdit;

    procedure FormShow(Sender: TObject);
    procedure btnSaveCalculateClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
  
  private
    { Private declarations }
    isSolidary : Boolean;
  public
    { Public declarations }

  substationCode, elementCode : Integer;

end;

var
  frmENPriconnectionDataEdit: TfrmENPriconnectionDataEdit;
  ENPriconnectionDataObj: ENPriconnectionData;
  

implementation


uses
    ENElementController, DMReportsUnit;

{$R *.dfm}


var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPriconnectionDataHeaders: array [1..22] of String =
        ( 'Код'
          ,'Дата розрахунку'
          ,'Макс. потуж., кВт'
          ,'Макс. потуж. після реконструкції, кВт'
          ,'Заг. дог. потужність, кВт'
          ,'Дог. потуж. побут. споживачів, кВт'
          ,'Дог. потуж. юр. споживачів, кВт'
          ,'Потуж., що приєднується, кВт'
          ,'Потуж., що замовляється, кВт'
          ,'Кіл. споживачів, усього'
          ,'Кіл. побут. споживачів'
          ,'Кіл. юр. споживачів'
          ,'Коеф. використання потужності'
          ,'Резерв приєднаної потужності, кВт'
          ,'Вартість резерву приєднаної потужності, грн./кВт'
          ,'Вартість капітальних витрат з будівництва та/або реконструкції, тис. грн.'
          ,'Оприбуткована вартість демонтованого устаткування, тис. грн.'
          ,'Збільшення резерву приєднаної потужності, кВт'
          ,'Вартість резерву приєднаної потужності після реконструкції, грн./кВт'
          ,'Вартість приєднання, грн./кВт'
          ,'Примітка'
          ,'Користувач, що змінив'
        );



procedure TfrmENPriconnectionDataEdit.FormShow(Sender: TObject);
var
  i : Integer;
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  dataFilter : ENPriconnectionDataFilter;
  ENPriconnectionDataList : ENPriconnectionDataShortList;
begin

  TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

  if (ENPriconnectionDataObj = nil) then
    ENPriconnectionDataObj := DMReports.getPriconnectionDataByElementCode(elementCode);

  ///// 08.07.13 Определяем, солидарный ли договор
  isSolidary := DMReports.checkSolidaryConnections(ENPriconnectionDataObj.techCondServRef.code);
  /////

  // 17.03.2014... +++ для солтдарных - проверка наличия линейных стоимостей...
  if (isSolidary) then
  begin
    if not DMReports.checkLinesCost(ENPriconnectionDataObj.techCondServRef.code) then
      Application.MessageBox(PChar(
        'Для розрахунку необхідно вказати індивідуальну лінійну вартість для кожного договору з групи!' +#13+
        'Вкладка ''''Одночасна участь''''.'), PChar('Увага!!!'), MB_ICONINFORMATION);
  end;

  SetFloatStyle([edtPowerContractNewTU, edtPowerReserveCurrent,
                 edtCostTPBuilding, edtCostDismantling,
                 edtCostTPBuildingSolidary, edtCostDismantlingSolidary, edtOtherCosts,
                 edtT1powerCurrent, edtT1powerNew,
                 edtT2powerCurrent, edtT2powerNew,
                 edtT3powerCurrent, edtT3powerNew,
                 edtCostLines04Building, edtCostLines10Building,
                 edtCostLines04Building1, edtCostLines04Building2, edtCostLines04Building3,
                 edtCostLines10Building1, edtCostLines10Building2, edtCostLines10Building3]);

  DisableControls([edtPowerMaxCurrent
      ,edtPowerMaxAfterReconstr
      ,edtPowerContractTotal
      ,edtPowerContractByt
      ,edtPowerContractProm
      ,edtPowerContractTU
      ,edtCountCustomer
      ,edtCountCustomerByt
      ,edtCountCustomerProm
      ,edtCoeffUsage
      ,edtPowerReserveCurrent
      ,edtPriceCurrent
      ,edtPowerReserveAfterReconstr
      ,edtPriceAfterReconstr
      ,edtPaySum
      ,edtCostFactExpenses
      ,edtT1powerCurrent
      ,edtT2powerCurrent
      ,edtT3powerCurrent]);

  edtT1powerCurrent.Text := '0';
  edtT1powerNew.Text := '0';
  edtT2powerCurrent.Text := '0';
  edtT2powerNew.Text := '0';
  edtT3powerCurrent.Text := '0';
  edtT3powerNew.Text := '0';


  if DialogState = dsView then
    DisableControls([btnSaveCalculate]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtPowerContractNewTU
      ,edtCostTPBuilding
      ,edtCostDismantling
      ,edtT1powerNew
      ,edtT2powerNew
      ,edtT3powerNew
      ,edtCostLines04Building, edtCostLines10Building
      ,edtCostLines04Building1, edtCostLines04Building2, edtCostLines04Building3
      ,edtCostLines10Building1, edtCostLines10Building2, edtCostLines10Building3
      ,edtCostTPBuildingSolidary, edtCostDismantlingSolidary, edtOtherCosts
      ]);

    ///// 08.07.13
    if isSolidary then
      DisableControls([edtCostTPBuilding, edtCostDismantling, edtCostLines04Building, edtCostLines10Building])
    else
      DisableControls([edtCostTPBuildingSolidary, edtCostDismantlingSolidary, edtOtherCosts]);
    /////
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENPriconnectionDataObj.code);

    if ( ENPriconnectionDataObj.powerMaxCurrent <> nil ) then
       edtPowerMaxCurrent.Text := ENPriconnectionDataObj.powerMaxCurrent.decimalString
    else
       edtPowerMaxCurrent.Text := ''; 
    if ( ENPriconnectionDataObj.powerMaxAfterReconstr <> nil ) then
       edtPowerMaxAfterReconstr.Text := ENPriconnectionDataObj.powerMaxAfterReconstr.decimalString
    else
       edtPowerMaxAfterReconstr.Text := ''; 
    if ( ENPriconnectionDataObj.powerContractTotal <> nil ) then
       edtPowerContractTotal.Text := ENPriconnectionDataObj.powerContractTotal.decimalString
    else
       edtPowerContractTotal.Text := ''; 
    if ( ENPriconnectionDataObj.powerContractByt <> nil ) then
       edtPowerContractByt.Text := ENPriconnectionDataObj.powerContractByt.decimalString
    else
       edtPowerContractByt.Text := ''; 
    if ( ENPriconnectionDataObj.powerContractProm <> nil ) then
       edtPowerContractProm.Text := ENPriconnectionDataObj.powerContractProm.decimalString
    else
       edtPowerContractProm.Text := ''; 
    if ( ENPriconnectionDataObj.powerContractTU <> nil ) then
       edtPowerContractTU.Text := ENPriconnectionDataObj.powerContractTU.decimalString
    else
       edtPowerContractTU.Text := ''; 

    {
    if ( ENPriconnectionDataObj.powerContractNewTU <> nil ) then
       edtPowerContractNewTU.Text := ENPriconnectionDataObj.powerContractNewTU.decimalString
    else
       edtPowerContractNewTU.Text := '';
    }
    
    if ( ENPriconnectionDataObj.countCustomer <> Low(Integer) ) then
       edtCountCustomer.Text := IntToStr(ENPriconnectionDataObj.countCustomer)
    else
       edtCountCustomer.Text := '';
    if ( ENPriconnectionDataObj.countCustomerByt <> Low(Integer) ) then
       edtCountCustomerByt.Text := IntToStr(ENPriconnectionDataObj.countCustomerByt)
    else
       edtCountCustomerByt.Text := '';
    if ( ENPriconnectionDataObj.countCustomerProm <> Low(Integer) ) then
       edtCountCustomerProm.Text := IntToStr(ENPriconnectionDataObj.countCustomerProm)
    else
       edtCountCustomerProm.Text := '';
    if ( ENPriconnectionDataObj.coeffUsage <> nil ) then
       edtCoeffUsage.Text := ENPriconnectionDataObj.coeffUsage.decimalString
    else
       edtCoeffUsage.Text := ''; 
    if ( ENPriconnectionDataObj.powerReserveCurrent <> nil ) then
       edtPowerReserveCurrent.Text := ENPriconnectionDataObj.powerReserveCurrent.decimalString
    else
       edtPowerReserveCurrent.Text := ''; 
    if ( ENPriconnectionDataObj.priceCurrent <> nil ) then
       edtPriceCurrent.Text := ENPriconnectionDataObj.priceCurrent.decimalString
    else
       edtPriceCurrent.Text := ''; 

    ///// 08.07.13
    if isSolidary then
    begin
      // ClearControls([edtCostTPBuilding, edtCostDismantling]);
      edtCostTPBuilding.Text := '0.000';
      edtCostDismantling.Text := '0.000';

      if ( ENPriconnectionDataObj.costTPBuilding <> nil ) then
         edtCostTPBuildingSolidary.Text := ENPriconnectionDataObj.costTPBuilding.decimalString
      else
         edtCostTPBuildingSolidary.Text := '';

      if ( ENPriconnectionDataObj.costDismantling <> nil ) then
         edtCostDismantlingSolidary.Text := ENPriconnectionDataObj.costDismantling.decimalString
      else
         edtCostDismantlingSolidary.Text := '';

      if ( ENPriconnectionDataObj.otherCosts <> nil ) then
         edtOtherCosts.Text := ENPriconnectionDataObj.otherCosts.decimalString
      else
         edtOtherCosts.Text := '';
    end
    else begin
      // ClearControls([edtCostTPBuildingSolidary, edtCostDismantlingSolidary]);
      edtCostTPBuildingSolidary.Text := '0.000';
      edtCostDismantlingSolidary.Text := '0.000';
      edtOtherCosts.Text := '0.000';
      
      if ( ENPriconnectionDataObj.costTPBuilding <> nil ) then
         edtCostTPBuilding.Text := ENPriconnectionDataObj.costTPBuilding.decimalString
      else
         edtCostTPBuilding.Text := '';

      if ( ENPriconnectionDataObj.costDismantling <> nil ) then
         edtCostDismantling.Text := ENPriconnectionDataObj.costDismantling.decimalString
      else
         edtCostDismantling.Text := '';
    end;
    /////

    if ( ENPriconnectionDataObj.powerReserveAfterReconstr <> nil ) then
       edtPowerReserveAfterReconstr.Text := ENPriconnectionDataObj.powerReserveAfterReconstr.decimalString
    else
       edtPowerReserveAfterReconstr.Text := ''; 
    if ( ENPriconnectionDataObj.priceAfterReconstr <> nil ) then
       edtPriceAfterReconstr.Text := ENPriconnectionDataObj.priceAfterReconstr.decimalString
    else
       edtPriceAfterReconstr.Text := '';

    if ( ENPriconnectionDataObj.paySum <> nil ) then
       edtPaySum.Text := ENPriconnectionDataObj.paySum.decimalString
    else
       edtPaySum.Text := '';

    if ( ENPriconnectionDataObj.costFactExpenses <> nil ) then
       edtCostFactExpenses.Text := ENPriconnectionDataObj.costFactExpenses.decimalString
    else
       edtCostFactExpenses.Text := '';

       
    if (ENPriconnectionDataObj.includeTU = CONNECTIONWORKTYPE_INCLUDECOST)
       then chbIncludeTU.Checked := True;
    if (ENPriconnectionDataObj.includeAgreement = CONNECTIONWORKTYPE_INCLUDECOST)
       then chbIncludeAgreement.Checked := True;
    if (ENPriconnectionDataObj.includeConnections = CONNECTIONWORKTYPE_INCLUDECOST)
       then chbIncludeConnections.Checked := True;

    if (ENPriconnectionDataObj.withOutReplacingTP = CONNECTIONWORKTYPE_INCLUDECOST)
       then chbWithOutReplacingTP.Checked := True;


   if ( ENPriconnectionDataObj.T1powerCurrent <> nil ) then
       edtT1powerCurrent.Text := ENPriconnectionDataObj.T1powerCurrent.decimalString
    else
       edtT1powerCurrent.Text := '0';
    if ( ENPriconnectionDataObj.T1powerNew <> nil ) then
       edtT1powerNew.Text := ENPriconnectionDataObj.T1powerNew.decimalString
    else
       edtT1powerNew.Text := '0';
    if ( ENPriconnectionDataObj.T2powerCurrent <> nil ) then
       edtT2powerCurrent.Text := ENPriconnectionDataObj.T2powerCurrent.decimalString
    else
       edtT2powerCurrent.Text := '0';
    if ( ENPriconnectionDataObj.T2powerNew <> nil ) then
       edtT2powerNew.Text := ENPriconnectionDataObj.T2powerNew.decimalString
    else
       edtT2powerNew.Text := '0';
    if ( ENPriconnectionDataObj.T3powerCurrent <> nil ) then
       edtT3powerCurrent.Text := ENPriconnectionDataObj.T3powerCurrent.decimalString
    else
       edtT3powerCurrent.Text := '0';
    if ( ENPriconnectionDataObj.T3powerNew <> nil ) then
       edtT3powerNew.Text := ENPriconnectionDataObj.T3powerNew.decimalString
    else
       edtT3powerNew.Text := '0';

    //////////////////////////////////
    if (ENPriconnectionDataObj.costLines04Building <> nil) then
      edtCostLines04Building.Text := ENPriconnectionDataObj.costLines04Building.decimalString
    else
      edtCostLines04Building.Text := '';

    if (ENPriconnectionDataObj.costLines04Building1 <> nil) then
      edtCostLines04Building1.Text := ENPriconnectionDataObj.costLines04Building1.decimalString
    else
      edtCostLines04Building1.Text := '';
    if (ENPriconnectionDataObj.costLines04Building2 <> nil) then
      edtCostLines04Building2.Text := ENPriconnectionDataObj.costLines04Building2.decimalString
    else
      edtCostLines04Building2.Text := '';
    if (ENPriconnectionDataObj.costLines04Building3 <> nil) then
      edtCostLines04Building3.Text := ENPriconnectionDataObj.costLines04Building3.decimalString
    else
      edtCostLines04Building3.Text := '';


    if (ENPriconnectionDataObj.costLines10Building <> nil) then
      edtCostLines10Building.Text := ENPriconnectionDataObj.costLines10Building.decimalString
    else
      edtCostLines10Building.Text := '';
      
    if (ENPriconnectionDataObj.costLines10Building1 <> nil) then
      edtCostLines10Building1.Text := ENPriconnectionDataObj.costLines10Building1.decimalString
    else
      edtCostLines10Building1.Text := '';
    if (ENPriconnectionDataObj.costLines10Building2 <> nil) then
      edtCostLines10Building2.Text := ENPriconnectionDataObj.costLines10Building2.decimalString
    else
      edtCostLines10Building2.Text := '';
    if (ENPriconnectionDataObj.costLines10Building3 <> nil) then
      edtCostLines10Building3.Text := ENPriconnectionDataObj.costLines10Building3.decimalString
    else
      edtCostLines10Building3.Text := '';
    //////////////////////////////////

    edtCommentGen.Text := ENPriconnectionDataObj.commentGen;
  end;


  dataFilter := ENPriconnectionDataFilter.Create;
  SetNullIntProps(dataFilter);
  SetNullXSProps(dataFilter);
  dataFilter.elementRef := ENElementRef.Create;
  dataFilter.elementRef.code := elementCode;
  dataFilter.orderBySQL := ' code desc';

  SetGridHeaders(ENPriconnectionDataHeaders, sgENPriconnectionData.ColumnHeaders);
  ColCount := 100;
  TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

  ENPriconnectionDataList := TempENPriconnectionData.getScrollableFilteredList(ENPriconnectionDataFilter(dataFilter),0,ColCount);

  LastCount:=High(ENPriconnectionDataList.list);

  if LastCount > -1 then
     sgENPriconnectionData.RowCount:=LastCount+2
  else
     sgENPriconnectionData.RowCount:=2;

   with sgENPriconnectionData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPriconnectionDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPriconnectionDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPriconnectionDataList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPriconnectionDataList.list[i].dateGen);
        if ENPriconnectionDataList.list[i].powerMaxCurrent = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENPriconnectionDataList.list[i].powerMaxCurrent.DecimalString;
        if ENPriconnectionDataList.list[i].powerMaxAfterReconstr = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPriconnectionDataList.list[i].powerMaxAfterReconstr.DecimalString;
        if ENPriconnectionDataList.list[i].powerContractTotal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPriconnectionDataList.list[i].powerContractTotal.DecimalString;
        if ENPriconnectionDataList.list[i].powerContractByt = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENPriconnectionDataList.list[i].powerContractByt.DecimalString;
        if ENPriconnectionDataList.list[i].powerContractProm = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENPriconnectionDataList.list[i].powerContractProm.DecimalString;
        if ENPriconnectionDataList.list[i].powerContractTU = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENPriconnectionDataList.list[i].powerContractTU.DecimalString;
        if ENPriconnectionDataList.list[i].powerContractNewTU = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENPriconnectionDataList.list[i].powerContractNewTU.DecimalString;
        if ENPriconnectionDataList.list[i].countCustomer = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(ENPriconnectionDataList.list[i].countCustomer);
        if ENPriconnectionDataList.list[i].countCustomerByt = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(ENPriconnectionDataList.list[i].countCustomerByt);
        if ENPriconnectionDataList.list[i].countCustomerProm = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(ENPriconnectionDataList.list[i].countCustomerProm);
        if ENPriconnectionDataList.list[i].coeffUsage = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENPriconnectionDataList.list[i].coeffUsage.DecimalString;
        if ENPriconnectionDataList.list[i].powerReserveCurrent = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENPriconnectionDataList.list[i].powerReserveCurrent.DecimalString;
        if ENPriconnectionDataList.list[i].priceCurrent = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENPriconnectionDataList.list[i].priceCurrent.DecimalString;

        if ENPriconnectionDataList.list[i].costTPBuilding = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENPriconnectionDataList.list[i].costTPBuilding.DecimalString;

        if ENPriconnectionDataList.list[i].costDismantling = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENPriconnectionDataList.list[i].costDismantling.DecimalString;
        if ENPriconnectionDataList.list[i].powerReserveAfterReconstr = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENPriconnectionDataList.list[i].powerReserveAfterReconstr.DecimalString;
        if ENPriconnectionDataList.list[i].priceAfterReconstr = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENPriconnectionDataList.list[i].priceAfterReconstr.DecimalString;

        if ENPriconnectionDataList.list[i].paySum = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENPriconnectionDataList.list[i].paySum.DecimalString;

        Cells[20,i+1] := ENPriconnectionDataList.list[i].commentGen;
        Cells[21,i+1] := ENPriconnectionDataList.list[i].userGen;
        LastRow:=i+1;
        sgENPriconnectionData.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPriconnectionData.Row:=1;

end;



procedure TfrmENPriconnectionDataEdit.btnCalculateClick(Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  calculatedData : ENPriconnectionData;
  powerContractNewTU, powerReserveCurrent, t1powerNew : Double;
begin
  if not NoBlankValues([edtPowerContractNewTU{, edtCostTPBuilding, edtCostDismantling}
      ,edtCostLines04Building
      ,edtCostLines10Building
      ,edtT1powerCurrent
      ,edtT1powerNew
      ,edtT2powerCurrent
      ,edtT2powerNew
      ,edtT3powerCurrent
      ,edtT3powerNew]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    ///// 08.07.13
    if isSolidary then
    begin
      if not NoBlankValues([edtCostTPBuildingSolidary, edtCostDismantlingSolidary]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;
    end
    else begin
      if not NoBlankValues([edtCostTPBuilding, edtCostDismantling]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;
    end;
    /////

    powerContractNewTU := StrToFloat(edtPowerContractNewTU.Text);
    powerReserveCurrent := StrToFloat(ENPriconnectionDataObj.powerReserveCurrent.DecimalString);
    t1powerNew := StrToFloat(edtT1powerNew.Text);

    // SUPP-6084...
    if (chbWithOutReplacingTP.Checked) then
      powerReserveCurrent := powerContractNewTU;

    if ((powerContractNewTU > powerReserveCurrent) and (t1powerNew = 0)) then
    begin
      Application.MessageBox(PChar('Замовлена потужність перевищує резерв!!! Вкажіть номінальну потужність після реконструкції!!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;


    TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

     if (ENPriconnectionDataObj.powerMaxCurrent = nil ) then
       ENPriconnectionDataObj.powerMaxCurrent := TXSDecimal.Create;
     if edtPowerMaxCurrent.Text <> '' then
       ENPriconnectionDataObj.powerMaxCurrent.decimalString := edtPowerMaxCurrent.Text 
     else
       ENPriconnectionDataObj.powerMaxCurrent := nil;

     if (ENPriconnectionDataObj.powerMaxAfterReconstr = nil ) then
       ENPriconnectionDataObj.powerMaxAfterReconstr := TXSDecimal.Create;
     if edtPowerMaxAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.powerMaxAfterReconstr.decimalString := edtPowerMaxAfterReconstr.Text 
     else
       ENPriconnectionDataObj.powerMaxAfterReconstr := nil;

     if (ENPriconnectionDataObj.powerContractTotal = nil ) then
       ENPriconnectionDataObj.powerContractTotal := TXSDecimal.Create;
     if edtPowerContractTotal.Text <> '' then
       ENPriconnectionDataObj.powerContractTotal.decimalString := edtPowerContractTotal.Text 
     else
       ENPriconnectionDataObj.powerContractTotal := nil;

     if (ENPriconnectionDataObj.powerContractByt = nil ) then
       ENPriconnectionDataObj.powerContractByt := TXSDecimal.Create;
     if edtPowerContractByt.Text <> '' then
       ENPriconnectionDataObj.powerContractByt.decimalString := edtPowerContractByt.Text 
     else
       ENPriconnectionDataObj.powerContractByt := nil;

     if (ENPriconnectionDataObj.powerContractProm = nil ) then
       ENPriconnectionDataObj.powerContractProm := TXSDecimal.Create;
     if edtPowerContractProm.Text <> '' then
       ENPriconnectionDataObj.powerContractProm.decimalString := edtPowerContractProm.Text 
     else
       ENPriconnectionDataObj.powerContractProm := nil;

     if (ENPriconnectionDataObj.powerContractTU = nil ) then
       ENPriconnectionDataObj.powerContractTU := TXSDecimal.Create;
     if edtPowerContractTU.Text <> '' then
       ENPriconnectionDataObj.powerContractTU.decimalString := edtPowerContractTU.Text 
     else
       ENPriconnectionDataObj.powerContractTU := nil;

     if (ENPriconnectionDataObj.powerContractNewTU = nil ) then
       ENPriconnectionDataObj.powerContractNewTU := TXSDecimal.Create;
     if edtPowerContractNewTU.Text <> '' then
       ENPriconnectionDataObj.powerContractNewTU.decimalString := edtPowerContractNewTU.Text 
     else
       ENPriconnectionDataObj.powerContractNewTU := nil;

     if ( edtCountCustomer.Text <> '' ) then
       ENPriconnectionDataObj.countCustomer := StrToInt(edtCountCustomer.Text)
     else
       ENPriconnectionDataObj.countCustomer := Low(Integer) ;

     if ( edtCountCustomerByt.Text <> '' ) then
       ENPriconnectionDataObj.countCustomerByt := StrToInt(edtCountCustomerByt.Text)
     else
       ENPriconnectionDataObj.countCustomerByt := Low(Integer) ;

     if ( edtCountCustomerProm.Text <> '' ) then
       ENPriconnectionDataObj.countCustomerProm := StrToInt(edtCountCustomerProm.Text)
     else
       ENPriconnectionDataObj.countCustomerProm := Low(Integer) ;

     if (ENPriconnectionDataObj.coeffUsage = nil ) then
       ENPriconnectionDataObj.coeffUsage := TXSDecimal.Create;
     if edtCoeffUsage.Text <> '' then
       ENPriconnectionDataObj.coeffUsage.decimalString := edtCoeffUsage.Text 
     else
       ENPriconnectionDataObj.coeffUsage := nil;

     if (ENPriconnectionDataObj.powerReserveCurrent = nil ) then
       ENPriconnectionDataObj.powerReserveCurrent := TXSDecimal.Create;
     if edtPowerReserveCurrent.Text <> '' then
       ENPriconnectionDataObj.powerReserveCurrent.decimalString := edtPowerReserveCurrent.Text 
     else
       ENPriconnectionDataObj.powerReserveCurrent := nil;

     if (ENPriconnectionDataObj.priceCurrent = nil ) then
       ENPriconnectionDataObj.priceCurrent := TXSDecimal.Create;
     if edtPriceCurrent.Text <> '' then
       ENPriconnectionDataObj.priceCurrent.decimalString := edtPriceCurrent.Text 
     else
       ENPriconnectionDataObj.priceCurrent := nil;

     ///// 08.07.13
     if isSolidary then
     begin
       if (ENPriconnectionDataObj.costTPBuilding = nil ) then
         ENPriconnectionDataObj.costTPBuilding := TXSDecimal.Create;
       if edtCostTPBuildingSolidary.Text <> '' then
         ENPriconnectionDataObj.costTPBuilding.decimalString := edtCostTPBuildingSolidary.Text
       else
         ENPriconnectionDataObj.costTPBuilding := nil;

       if (ENPriconnectionDataObj.costDismantling = nil ) then
         ENPriconnectionDataObj.costDismantling := TXSDecimal.Create;
       if edtCostDismantlingSolidary.Text <> '' then
         ENPriconnectionDataObj.costDismantling.decimalString := edtCostDismantlingSolidary.Text
       else
         ENPriconnectionDataObj.costDismantling := nil;

       if (ENPriconnectionDataObj.otherCosts = nil ) then
         ENPriconnectionDataObj.otherCosts := TXSDecimal.Create;
       if edtOtherCosts.Text <> '' then
         ENPriconnectionDataObj.otherCosts.decimalString := edtOtherCosts.Text
       else
         ENPriconnectionDataObj.otherCosts := nil;
     end
     else begin
       if (ENPriconnectionDataObj.costTPBuilding = nil ) then
         ENPriconnectionDataObj.costTPBuilding := TXSDecimal.Create;
       if edtCostTPBuilding.Text <> '' then
         ENPriconnectionDataObj.costTPBuilding.decimalString := edtCostTPBuilding.Text
       else
         ENPriconnectionDataObj.costTPBuilding := nil;

       if (ENPriconnectionDataObj.costDismantling = nil ) then
         ENPriconnectionDataObj.costDismantling := TXSDecimal.Create;
       if edtCostDismantling.Text <> '' then
         ENPriconnectionDataObj.costDismantling.decimalString := edtCostDismantling.Text
       else
         ENPriconnectionDataObj.costDismantling := nil;
     end;
     /////


     if (ENPriconnectionDataObj.powerReserveAfterReconstr = nil ) then
       ENPriconnectionDataObj.powerReserveAfterReconstr := TXSDecimal.Create;
     if edtPowerReserveAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.powerReserveAfterReconstr.decimalString := edtPowerReserveAfterReconstr.Text 
     else
       ENPriconnectionDataObj.powerReserveAfterReconstr := nil;

     if (ENPriconnectionDataObj.priceAfterReconstr = nil ) then
       ENPriconnectionDataObj.priceAfterReconstr := TXSDecimal.Create;
     if edtPriceAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.priceAfterReconstr.decimalString := edtPriceAfterReconstr.Text 
     else
       ENPriconnectionDataObj.priceAfterReconstr := nil;

   if (ENPriconnectionDataObj.T1powerCurrent = nil ) then
       ENPriconnectionDataObj.T1powerCurrent := TXSDecimal.Create;
     if edtT1powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T1powerCurrent.decimalString := edtT1powerCurrent.Text 
     else
       ENPriconnectionDataObj.T1powerCurrent := nil;

     if (ENPriconnectionDataObj.T1powerNew = nil ) then
       ENPriconnectionDataObj.T1powerNew := TXSDecimal.Create;
     if edtT1powerNew.Text <> '' then
       ENPriconnectionDataObj.T1powerNew.decimalString := edtT1powerNew.Text 
     else
       ENPriconnectionDataObj.T1powerNew := nil;

     if (ENPriconnectionDataObj.T2powerCurrent = nil ) then
       ENPriconnectionDataObj.T2powerCurrent := TXSDecimal.Create;
     if edtT2powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T2powerCurrent.decimalString := edtT2powerCurrent.Text 
     else
       ENPriconnectionDataObj.T2powerCurrent := nil;

     if (ENPriconnectionDataObj.T2powerNew = nil ) then
       ENPriconnectionDataObj.T2powerNew := TXSDecimal.Create;
     if edtT2powerNew.Text <> '' then
       ENPriconnectionDataObj.T2powerNew.decimalString := edtT2powerNew.Text 
     else
       ENPriconnectionDataObj.T2powerNew := nil;

     if (ENPriconnectionDataObj.T3powerCurrent = nil ) then
       ENPriconnectionDataObj.T3powerCurrent := TXSDecimal.Create;
     if edtT3powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T3powerCurrent.decimalString := edtT3powerCurrent.Text 
     else
       ENPriconnectionDataObj.T3powerCurrent := nil;

     if (ENPriconnectionDataObj.T3powerNew = nil ) then
       ENPriconnectionDataObj.T3powerNew := TXSDecimal.Create;
     if edtT3powerNew.Text <> '' then
       ENPriconnectionDataObj.T3powerNew.decimalString := edtT3powerNew.Text 
     else
       ENPriconnectionDataObj.T3powerNew := nil;
              
     if (ENPriconnectionDataObj.paySum <> nil ) then
       edtPaySum.Text := ENPriconnectionDataObj.paySum.decimalString
     else
       edtPaySum.Text := '';

     if (ENPriconnectionDataObj.costFactExpenses <> nil ) then
       edtCostFactExpenses.Text := ENPriconnectionDataObj.costFactExpenses.decimalString
     else
       edtCostFactExpenses.Text := '';

     if (chbIncludeTU.Checked) then
        ENPriconnectionDataObj.includeTU := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeTU := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbIncludeAgreement.Checked) then
        ENPriconnectionDataObj.includeAgreement := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeAgreement := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbIncludeConnections.Checked) then
        ENPriconnectionDataObj.includeConnections := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeConnections := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbWithOutReplacingTP.Checked) then
        ENPriconnectionDataObj.withOutReplacingTP := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.withOutReplacingTP := CONNECTIONWORKTYPE_NOT_INCLUDECOST;


    ///////////////////////////////////////////////////////
     if (ENPriconnectionDataObj.costLines04Building = nil ) then
       ENPriconnectionDataObj.costLines04Building := TXSDecimal.Create;
     if edtCostLines04Building.Text <> '' then
       ENPriconnectionDataObj.costLines04Building.decimalString := edtCostLines04Building.Text
     else
       ENPriconnectionDataObj.costLines04Building := nil;

     if (ENPriconnectionDataObj.costLines04Building1 = nil ) then
       ENPriconnectionDataObj.costLines04Building1 := TXSDecimal.Create;
     if edtCostLines04Building1.Text <> '' then
       ENPriconnectionDataObj.costLines04Building1.decimalString := edtCostLines04Building1.Text
     else
       ENPriconnectionDataObj.costLines04Building1 := nil;
     if (ENPriconnectionDataObj.costLines04Building2 = nil ) then
       ENPriconnectionDataObj.costLines04Building2 := TXSDecimal.Create;
     if edtCostLines04Building2.Text <> '' then
       ENPriconnectionDataObj.costLines04Building2.decimalString := edtCostLines04Building2.Text
     else
       ENPriconnectionDataObj.costLines04Building2 := nil;
     if (ENPriconnectionDataObj.costLines04Building3 = nil ) then
       ENPriconnectionDataObj.costLines04Building3 := TXSDecimal.Create;
     if edtCostLines04Building3.Text <> '' then
       ENPriconnectionDataObj.costLines04Building3.decimalString := edtCostLines04Building3.Text
     else
       ENPriconnectionDataObj.costLines04Building3 := nil;


     if (ENPriconnectionDataObj.costLines10Building = nil ) then
       ENPriconnectionDataObj.costLines10Building := TXSDecimal.Create;
     if edtCostLines10Building.Text <> '' then
       ENPriconnectionDataObj.costLines10Building.decimalString := edtCostLines10Building.Text
     else
       ENPriconnectionDataObj.costLines10Building := nil;

     if (ENPriconnectionDataObj.costLines10Building1 = nil ) then
       ENPriconnectionDataObj.costLines10Building1 := TXSDecimal.Create;
     if edtCostLines10Building1.Text <> '' then
       ENPriconnectionDataObj.costLines10Building1.decimalString := edtCostLines10Building1.Text
     else
       ENPriconnectionDataObj.costLines10Building1 := nil;
     if (ENPriconnectionDataObj.costLines10Building2 = nil ) then
       ENPriconnectionDataObj.costLines10Building2 := TXSDecimal.Create;
     if edtCostLines10Building2.Text <> '' then
       ENPriconnectionDataObj.costLines10Building2.decimalString := edtCostLines10Building2.Text
     else
       ENPriconnectionDataObj.costLines10Building2 := nil;
     if (ENPriconnectionDataObj.costLines10Building3 = nil ) then
       ENPriconnectionDataObj.costLines10Building3 := TXSDecimal.Create;
     if edtCostLines10Building3.Text <> '' then
       ENPriconnectionDataObj.costLines10Building3.decimalString := edtCostLines10Building3.Text
     else
       ENPriconnectionDataObj.costLines10Building3 := nil;

    ///////////////////////////////////////////////////////
         
    ENPriconnectionDataObj.commentGen := edtCommentGen.Text;

    ENPriconnectionDataObj.elementRef := ENElementRef.Create;
    ENPriconnectionDataObj.elementRef.code := elementCode;

    calculatedData := TempENPriconnectionData.calculateData(ENPriconnectionDataObj);

    edtPowerMaxAfterReconstr.Text := calculatedData.powerMaxAfterReconstr.DecimalString;
    edtPowerReserveAfterReconstr.Text := calculatedData.powerReserveAfterReconstr.DecimalString;
    edtPriceAfterReconstr.Text := calculatedData.priceAfterReconstr.DecimalString;
    edtCostFactExpenses.Text := calculatedData.costFactExpenses.DecimalString;

    edtPaySum.Text := calculatedData.paySum.DecimalString;

  end;
end;




procedure TfrmENPriconnectionDataEdit.btnSaveCalculateClick(Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
begin

  // 04.06.2013 +++ даем пересчитать и сохранить расчет стоимости....
  // if Application.MessageBox(PChar('ПІСЛЯ ЗБЕРЕЖЕННЯ РОЗРАХУНКУ ПОДАЛЬШЕ РЕДАГУВАННЯ ТА ВИДАЛЕННЯ БУДУТЬ НЕМОЖЛИВІ!!!'),
  //       PChar('УВАГА!!!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK
  //   then Exit;


  if Application.MessageBox(PChar('Ви дійсно бажаєте зберегти розрахунок?'),
        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK
    then Exit;

  if not NoBlankValues([edtPowerContractNewTU, edtCostLines04Building {edtCostTPBuilding,  edtCostDismantling}
      ,edtT1powerCurrent
      ,edtT1powerNew
      ,edtT2powerCurrent
      ,edtT2powerNew
      ,edtT3powerCurrent
      ,edtT3powerNew]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    ///// 08.07.13
    if isSolidary then
    begin
      if not NoBlankValues([edtCostTPBuildingSolidary, edtCostDismantlingSolidary]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;
    end
    else begin
      if not NoBlankValues([edtCostTPBuilding, edtCostDismantling]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;
    end;
    /////
    
    TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

     if (ENPriconnectionDataObj.powerMaxCurrent = nil ) then
       ENPriconnectionDataObj.powerMaxCurrent := TXSDecimal.Create;
     if edtPowerMaxCurrent.Text <> '' then
       ENPriconnectionDataObj.powerMaxCurrent.decimalString := edtPowerMaxCurrent.Text 
     else
       ENPriconnectionDataObj.powerMaxCurrent := nil;

     if (ENPriconnectionDataObj.powerMaxAfterReconstr = nil ) then
       ENPriconnectionDataObj.powerMaxAfterReconstr := TXSDecimal.Create;
     if edtPowerMaxAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.powerMaxAfterReconstr.decimalString := edtPowerMaxAfterReconstr.Text 
     else
       ENPriconnectionDataObj.powerMaxAfterReconstr := nil;

     if (ENPriconnectionDataObj.powerContractTotal = nil ) then
       ENPriconnectionDataObj.powerContractTotal := TXSDecimal.Create;
     if edtPowerContractTotal.Text <> '' then
       ENPriconnectionDataObj.powerContractTotal.decimalString := edtPowerContractTotal.Text 
     else
       ENPriconnectionDataObj.powerContractTotal := nil;

     if (ENPriconnectionDataObj.powerContractByt = nil ) then
       ENPriconnectionDataObj.powerContractByt := TXSDecimal.Create;
     if edtPowerContractByt.Text <> '' then
       ENPriconnectionDataObj.powerContractByt.decimalString := edtPowerContractByt.Text 
     else
       ENPriconnectionDataObj.powerContractByt := nil;

     if (ENPriconnectionDataObj.powerContractProm = nil ) then
       ENPriconnectionDataObj.powerContractProm := TXSDecimal.Create;
     if edtPowerContractProm.Text <> '' then
       ENPriconnectionDataObj.powerContractProm.decimalString := edtPowerContractProm.Text 
     else
       ENPriconnectionDataObj.powerContractProm := nil;

     if (ENPriconnectionDataObj.powerContractTU = nil ) then
       ENPriconnectionDataObj.powerContractTU := TXSDecimal.Create;
     if edtPowerContractTU.Text <> '' then
       ENPriconnectionDataObj.powerContractTU.decimalString := edtPowerContractTU.Text 
     else
       ENPriconnectionDataObj.powerContractTU := nil;

     if (ENPriconnectionDataObj.powerContractNewTU = nil ) then
       ENPriconnectionDataObj.powerContractNewTU := TXSDecimal.Create;
     if edtPowerContractNewTU.Text <> '' then
       ENPriconnectionDataObj.powerContractNewTU.decimalString := edtPowerContractNewTU.Text 
     else
       ENPriconnectionDataObj.powerContractNewTU := nil;

     if ( edtCountCustomer.Text <> '' ) then
       ENPriconnectionDataObj.countCustomer := StrToInt(edtCountCustomer.Text)
     else
       ENPriconnectionDataObj.countCustomer := Low(Integer) ;

     if ( edtCountCustomerByt.Text <> '' ) then
       ENPriconnectionDataObj.countCustomerByt := StrToInt(edtCountCustomerByt.Text)
     else
       ENPriconnectionDataObj.countCustomerByt := Low(Integer) ;

     if ( edtCountCustomerProm.Text <> '' ) then
       ENPriconnectionDataObj.countCustomerProm := StrToInt(edtCountCustomerProm.Text)
     else
       ENPriconnectionDataObj.countCustomerProm := Low(Integer) ;

     if (ENPriconnectionDataObj.coeffUsage = nil ) then
       ENPriconnectionDataObj.coeffUsage := TXSDecimal.Create;
     if edtCoeffUsage.Text <> '' then
       ENPriconnectionDataObj.coeffUsage.decimalString := edtCoeffUsage.Text 
     else
       ENPriconnectionDataObj.coeffUsage := nil;

     if (ENPriconnectionDataObj.powerReserveCurrent = nil ) then
       ENPriconnectionDataObj.powerReserveCurrent := TXSDecimal.Create;
     if edtPowerReserveCurrent.Text <> '' then
       ENPriconnectionDataObj.powerReserveCurrent.decimalString := edtPowerReserveCurrent.Text 
     else
       ENPriconnectionDataObj.powerReserveCurrent := nil;

     if (ENPriconnectionDataObj.priceCurrent = nil ) then
       ENPriconnectionDataObj.priceCurrent := TXSDecimal.Create;
     if edtPriceCurrent.Text <> '' then
       ENPriconnectionDataObj.priceCurrent.decimalString := edtPriceCurrent.Text 
     else
       ENPriconnectionDataObj.priceCurrent := nil;

     ///// 08.07.13
     if isSolidary then
     begin
       if (ENPriconnectionDataObj.costTPBuilding = nil ) then
         ENPriconnectionDataObj.costTPBuilding := TXSDecimal.Create;
       if edtCostTPBuildingSolidary.Text <> '' then
         ENPriconnectionDataObj.costTPBuilding.decimalString := edtCostTPBuildingSolidary.Text
       else
         ENPriconnectionDataObj.costTPBuilding := nil;

       if (ENPriconnectionDataObj.costDismantling = nil ) then
         ENPriconnectionDataObj.costDismantling := TXSDecimal.Create;
       if edtCostDismantlingSolidary.Text <> '' then
         ENPriconnectionDataObj.costDismantling.decimalString := edtCostDismantlingSolidary.Text
       else
         ENPriconnectionDataObj.costDismantling := nil;

       if (ENPriconnectionDataObj.otherCosts = nil ) then
         ENPriconnectionDataObj.otherCosts := TXSDecimal.Create;
       if edtOtherCosts.Text <> '' then
         ENPriconnectionDataObj.otherCosts.decimalString := edtOtherCosts.Text
       else
         ENPriconnectionDataObj.otherCosts := nil;
     end
     else begin
       if (ENPriconnectionDataObj.costTPBuilding = nil ) then
         ENPriconnectionDataObj.costTPBuilding := TXSDecimal.Create;
       if edtCostTPBuilding.Text <> '' then
         ENPriconnectionDataObj.costTPBuilding.decimalString := edtCostTPBuilding.Text
       else
         ENPriconnectionDataObj.costTPBuilding := nil;

       if (ENPriconnectionDataObj.costDismantling = nil ) then
         ENPriconnectionDataObj.costDismantling := TXSDecimal.Create;
       if edtCostDismantling.Text <> '' then
         ENPriconnectionDataObj.costDismantling.decimalString := edtCostDismantling.Text
       else
         ENPriconnectionDataObj.costDismantling := nil;
     end;
     /////



     if (ENPriconnectionDataObj.costLines04Building = nil ) then
       ENPriconnectionDataObj.costLines04Building := TXSDecimal.Create;
     if edtCostLines04Building.Text <> '' then
       ENPriconnectionDataObj.costLines04Building.decimalString := edtCostLines04Building.Text
     else
       ENPriconnectionDataObj.costLines04Building := nil;


     if (ENPriconnectionDataObj.powerReserveAfterReconstr = nil ) then
       ENPriconnectionDataObj.powerReserveAfterReconstr := TXSDecimal.Create;
     if edtPowerReserveAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.powerReserveAfterReconstr.decimalString := edtPowerReserveAfterReconstr.Text 
     else
       ENPriconnectionDataObj.powerReserveAfterReconstr := nil;

     if (ENPriconnectionDataObj.priceAfterReconstr = nil ) then
       ENPriconnectionDataObj.priceAfterReconstr := TXSDecimal.Create;
     if edtPriceAfterReconstr.Text <> '' then
       ENPriconnectionDataObj.priceAfterReconstr.decimalString := edtPriceAfterReconstr.Text 
     else
       ENPriconnectionDataObj.priceAfterReconstr := nil;

     if (ENPriconnectionDataObj.paySum = nil ) then
       ENPriconnectionDataObj.paySum := TXSDecimal.Create;
     if edtPaySum.Text <> '' then
       ENPriconnectionDataObj.paySum.decimalString := edtPaySum.Text 
     else
       ENPriconnectionDataObj.paySum := nil;

    ///// Проверим, чтобы не сохраняли без расчета
    if ENPriconnectionDataObj.paySum = nil then
      raise Exception.Create('NET-4237 Спочатку потібно зробити розрахунок!');

    if StrToFloat(ENPriconnectionDataObj.paySum.DecimalString) = 0 then
      raise Exception.Create('NET-4237 Спочатку потібно зробити розрахунок!');
    /////

    if (ENPriconnectionDataObj.T1powerCurrent = nil ) then
       ENPriconnectionDataObj.T1powerCurrent := TXSDecimal.Create;
     if edtT1powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T1powerCurrent.decimalString := edtT1powerCurrent.Text 
     else
       ENPriconnectionDataObj.T1powerCurrent := nil;

     if (ENPriconnectionDataObj.T1powerNew = nil ) then
       ENPriconnectionDataObj.T1powerNew := TXSDecimal.Create;
     if edtT1powerNew.Text <> '' then
       ENPriconnectionDataObj.T1powerNew.decimalString := edtT1powerNew.Text 
     else
       ENPriconnectionDataObj.T1powerNew := nil;

     if (ENPriconnectionDataObj.T2powerCurrent = nil ) then
       ENPriconnectionDataObj.T2powerCurrent := TXSDecimal.Create;
     if edtT2powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T2powerCurrent.decimalString := edtT2powerCurrent.Text 
     else
       ENPriconnectionDataObj.T2powerCurrent := nil;

     if (ENPriconnectionDataObj.T2powerNew = nil ) then
       ENPriconnectionDataObj.T2powerNew := TXSDecimal.Create;
     if edtT2powerNew.Text <> '' then
       ENPriconnectionDataObj.T2powerNew.decimalString := edtT2powerNew.Text 
     else
       ENPriconnectionDataObj.T2powerNew := nil;

     if (ENPriconnectionDataObj.T3powerCurrent = nil ) then
       ENPriconnectionDataObj.T3powerCurrent := TXSDecimal.Create;
     if edtT3powerCurrent.Text <> '' then
       ENPriconnectionDataObj.T3powerCurrent.decimalString := edtT3powerCurrent.Text
     else
       ENPriconnectionDataObj.T3powerCurrent := nil;

     if (ENPriconnectionDataObj.T3powerNew = nil ) then
       ENPriconnectionDataObj.T3powerNew := TXSDecimal.Create;
     if edtT3powerNew.Text <> '' then
       ENPriconnectionDataObj.T3powerNew.decimalString := edtT3powerNew.Text 
     else
       ENPriconnectionDataObj.T3powerNew := nil;

     if (ENPriconnectionDataObj.costFactExpenses = nil ) then
       ENPriconnectionDataObj.costFactExpenses := TXSDecimal.Create;
     if (edtCostFactExpenses.Text <> '') then
       ENPriconnectionDataObj.costFactExpenses.decimalString := edtCostFactExpenses.Text
     else
       ENPriconnectionDataObj.costFactExpenses := nil;

     if (chbIncludeTU.Checked) then
        ENPriconnectionDataObj.includeTU := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeTU := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbIncludeAgreement.Checked) then
        ENPriconnectionDataObj.includeAgreement := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeAgreement := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbIncludeConnections.Checked) then
        ENPriconnectionDataObj.includeConnections := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.includeConnections := CONNECTIONWORKTYPE_NOT_INCLUDECOST;

     if (chbWithOutReplacingTP.Checked) then
        ENPriconnectionDataObj.withOutReplacingTP := CONNECTIONWORKTYPE_INCLUDECOST
     else
        ENPriconnectionDataObj.withOutReplacingTP := CONNECTIONWORKTYPE_NOT_INCLUDECOST;


    ENPriconnectionDataObj.commentGen := edtCommentGen.Text;

    ENPriconnectionDataObj.elementRef := ENElementRef.Create;
    ENPriconnectionDataObj.elementRef.code := elementCode;

    TempENPriconnectionData.saveCalculatedData(ENPriconnectionDataObj);
    FormShow(Sender);

  end;
end;



procedure TfrmENPriconnectionDataEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isSolidary := false;
end;

end.
