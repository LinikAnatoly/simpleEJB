unit ServicesPlanedPayAndWorks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmServicesPlanedPayAndWorks = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label6: TLabel;
    ListBudget: TCheckListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    chkKindMonth: TCheckBox;
    HTTPRIOTENDepartment: THTTPRIO;
    lbl1: TLabel;
    chkincludeExternalServicesInvest: TCheckBox;
    chkWithoutEnergozbyt: TCheckBox;
    chkMakeReportByGroupExecutor: TCheckBox;
    chkisKr: TCheckBox;
    GroupBox5: TGroupBox;
    cbPlanWorkTypeBudg: TCheckBox;
    cbPlanWorkTypeInvest: TCheckBox;
    chkonlycurrip: TCheckBox;
    chkWithoutEnergozbut: TCheckBox;
    lbltext: TLabel;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkisKrClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
  private
    { Private declarations }
    elementCode : Integer;
    elementName : String;
  public
    { Public declarations }
    kindReport : Integer;

  end;

var
  frmServicesPlanedPayAndWorks: TfrmServicesPlanedPayAndWorks;

implementation

uses
  ENDepartmentController, EnergyproController, DMReportsUnit, ShowENElement,
  ENElementController, ChildFormUnit;

{$R *.dfm}

procedure TfrmServicesPlanedPayAndWorks.SpeedButton1Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmServicesPlanedPayAndWorks.SpeedButton2Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmServicesPlanedPayAndWorks.FormShow(Sender: TObject);
var
 TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin

   elementCode:= 0;

   if kindReport in [1,2] then
      HideControls([lblMonthGen , edtMonthGen ]);
   if kindReport in [1,2,4] then
      HideControls([edtENElementName , lblENElementName , spbENElement , spbENElementClear]);

   if kindReport in [3] then
    begin
      HideControls([chkonlycurrip]);
        lblMonthGen.Caption := 'Місяць планів';
    end;
   // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';

     DisableControls([edtENElementName]);

     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;

end;

procedure TfrmServicesPlanedPayAndWorks.spbENElementClearClick(Sender: TObject);
begin
   elementCode := 0;
   elementName := '';
end;

procedure TfrmServicesPlanedPayAndWorks.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := ' 1 = 0';

  f.orderBySQL := 'typerefcode';

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
     frmENElementShow.isFiltered := True;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmServicesPlanedPayAndWorks.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName, strBudget : String;
  i : Integer;
begin
  SetLength(argNames, 7);
  SetLength(args, 7);

  strBudget:= '';
  argNames[0] := 'yeargen';
  args[0] := edtYearGen.Text;

  argnames[1] := 'budgetrefcode';
  For i:=0 to ListBudget.Count -1  do
  Begin
  if  ListBudget.Checked[i] then
    if strBudget <>  '' then
      strBudget := strBudget + ',' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
    else
      strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;
  End;

  strBudget :=  Trim(strBudget);
  if Length(strBudget) = 0 then
  begin
    Application.MessageBox(PChar('Необхідно обрати бюджетотримача !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    ModalResult := mrNone;
    Exit;
  end
  else
  begin
    strBudget := strBudget ;
    args[1] := strBudget ;
  end;

  if  ((kindReport = 3) and  (edtMonthGen.ItemIndex <=0))  then
  begin
    Application.MessageBox(PChar('Необхідно обрати місяць планів !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    ModalResult := mrNone;
    Exit;
  end;



  argNames[2] := 'enplanworktype';
  if (cbPlanWorkTypeBudg.Checked) and (not cbPlanWorkTypeInvest.Checked) then
    args[2] := '19' // услуги со стороны
  else
  if (not cbPlanWorkTypeBudg.Checked) and (cbPlanWorkTypeInvest.Checked) then
    args[2] := '20' // услуги со стороны по инвест программе
  else
    args[2] := '-1'; // типа все


    argNames[3] := 'onlycurrip';
    if chkonlycurrip.checked then
    args[3] := '1'
    else
    args[3] := '0';
    
    argNames[4] := 'UseEnergozbut';
    if chkWithoutEnergozbut.checked then
    args[4] := '0'
    else
    args[4] := '1';

    argNames[5] := 'monthgen';
    if (edtMonthGen.ItemIndex >= 1 ) then
     begin
       args[5] := IntToStr(edtMonthGen.ItemIndex);
     end;


     argNames[6] := 'elementcode';
     args[6]:= IntToStr(elementCode);



    
  {
  argNames[4] := 'includePlanEnergosbut';
  if chkWithoutEnergozbyt.Checked then
  args[4] := '0' // НЕ включаем планы енергосбыта
  else
  args[4] := '1'; //  включаем планы енергосбыта
  }
      
    { if chkMakeReportByGroupExecutor.Checked then
     reportName := 'repByPlansInvestProgram2'     // если в разрезе исполнителей то на отчете показываются группы исполнителей и внутри сортировка по подразделениям
     else
     reportName := 'repByPlansInvestProgram';     // по умолчанию  отчет формируем с выводом групп по подразделениям и сортировкой внутри по исполнителям
     }

  {
  argNames[5] := 'isKr';
  if chkisKr.Checked then
  args[5] := '1' // отчет только по КР инвест программа
  else
  args[5] := '0'; //
  }

  //reportName := 'plan_pay_year';
  if kindReport = 1 then   
  reportName := 'Invest/payment/finansir'
  else if kindReport = 2 then
  reportName := 'Invest/vikonannya/vik'
  else if kindReport = 3 then
  begin
  args[3] := '1';
  reportName := 'Invest/vikonannya_extended/vikxtd';
  end
  else if kindReport = 4  then
     reportName := 'Invest/payment_with_monthsrez/finansir';
       
  
  makeReport(reportName, argNames, args, 'xls');

end;


procedure TfrmServicesPlanedPayAndWorks.chkisKrClick(Sender: TObject);
begin
 // inherited;
    if chkisKr.Checked then
   begin
      chkincludeExternalServicesInvest.Checked := False;
      chkincludeExternalServicesInvest.Enabled := False;
   end
   else
      chkincludeExternalServicesInvest.Enabled := True;
end;

end.
