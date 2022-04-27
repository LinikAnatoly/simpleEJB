unit Dodatok4Invest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmDodatok4Invest = class(TDialogForm)
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
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkisKrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDodatok4Invest: TfrmDodatok4Invest;

implementation

uses
  ENDepartmentController, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmDodatok4Invest.SpeedButton1Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmDodatok4Invest.SpeedButton2Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmDodatok4Invest.FormShow(Sender: TObject);
var
 TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin

   // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';



     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;

end;

procedure TfrmDodatok4Invest.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName , strBudget : String;
     i : Integer;
begin

      SetLength(argNames, 6);
      SetLength(args, 6);

      strBudget:= '';
      argNames[0] := 'year';
      args[0] := edtYearGen.Text;


      argNames[1] := 'enplankind';
      if chkKindMonth.Checked then
      args[1] := '2'
      else
      args[1] := '1';

      argnames[2] := 'budjetcodes';
      For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ',' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

    End;

            strBudget := Trim(strBudget);
     if Length(strBudget) = 0 then
      begin
          Application.MessageBox(PChar('Необхідно обрати бюджетотримача !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
          Exit;
      end
     else
     begin
      strBudget := strBudget ;
      args[2] := strBudget ; 
     end;

      argNames[3] := 'includeExternalServicesInvest';
      if chkincludeExternalServicesInvest.Checked then
      args[3] := '1' // включаем услуги со стороны по инвест программе
      else
      args[3] := '0'; // не включаем услуги со стороны по инвест программе

      argNames[4] := 'includePlanEnergosbut';
      if chkWithoutEnergozbyt.Checked then
      args[4] := '0' // НЕ включаем планы енергосбыта
      else
      args[4] := '1'; //  включаем планы енергосбыта

      
    { if chkMakeReportByGroupExecutor.Checked then
     reportName := 'repByPlansInvestProgram2'     // если в разрезе исполнителей то на отчете показываются группы исполнителей и внутри сортировка по подразделениям
     else
     reportName := 'repByPlansInvestProgram';     // по умолчанию  отчет формируем с выводом групп по подразделениям и сортировкой внутри по исполнителям
     }

      argNames[5] := 'isKr';
      if chkisKr.Checked then
      args[5] := '1' // отчет только по КР инвест программа  
      else
      args[5] := '0'; //


      if chkMakeReportByGroupExecutor.Checked then
     reportName := 'InvestProgramOplDone/repByPlansInvestProgram2'     // если в разрезе исполнителей то на отчете показываются группы исполнителей и внутри сортировка по подразделениям
     else
     reportName := 'InvestProgramOplDone/repByPlansInvestProgram';     // по умолчанию  отчет формируем с выводом групп по подразделениям и сортировкой внутри по исполнителям

     makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmDodatok4Invest.chkisKrClick(Sender: TObject);
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
