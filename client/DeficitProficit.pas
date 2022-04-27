unit DeficitProficit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, ComCtrls;

type
  TfrmDeficitProficit = class(TDialogForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    ListBudget: TCheckListBox;
    HTTPRIOTENDepartment: THTTPRIO;
    lblDateFrom: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDateContractTo: TDateTimePicker;
    edtDateContractFrom: TDateTimePicker;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    HTTPRIORQOrder: THTTPRIO;
    GroupBox1: TGroupBox;
    edtYearGen: TComboBox;
    Label5: TLabel;
    lblMonthGenStart: TLabel;
    edtMonthGenStart: TComboBox;
    lblMonthGenFinal: TLabel;
    edtMonthGenFinal: TComboBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
  maxorderperiod : String;
    { Public declarations }
  end;

var
  frmDeficitProficit: TfrmDeficitProficit;

implementation

uses ENDepartmentController, DMReportsUnit, EnergyproController,
  RQOrderController;

{$R *.dfm}

procedure TfrmDeficitProficit.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName  , strBudget : String;
  i, d: Integer;
begin

    strBudget:= '';
   For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ',' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

    End;

    if ((Length(strBudget) = 0 ) and ( ListBudget.Visible = True )) then
      begin
          Application.MessageBox(PChar('Необхідно обрати бюджетотримача !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
          Exit;
      end;

    SetLength(argNames, 8);
    SetLength(args, 8);

    argNames[0] :='monthGenStart';
    argNames[1] :='monthGenFinal';
    argNames[2] :='DateContractFrom';
    argNames[3] :='DateContractTo';
    argNames[4] :='strBudget';
    argnames[5] := 'maxorderperiod';
    argnames[6] := 'yearGen';


    args[0] := intToStr(edtMonthGenStart.ItemIndex + 1);
    args[1] := intToStr(edtMonthGenFinal.ItemIndex + 1);
    args[2] := DateToStr(edtDateContractFrom.Date);
    args[3] := DateToStr(edtDateContractTo.Date);
    args[4] := strBudget;
    args[5] := maxorderperiod;
    args[6] := edtYearGen.text;



   if CheckBox1.Checked = true  then
   reportName := 'Tender/deficProficDetail'
   else
   reportName := 'Tender/deficProfic';

makeReport(reportName, argNames, args, 'xls');

self.Close;

end;

procedure TfrmDeficitProficit.FormShow(Sender: TObject);
var
  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
  d,m,y : word;

   TempRQOrder: RQOrderControllerSoapPort;
   RQOrderList: RQOrderShortList;
   ordfilter : RQOrderFilter;
begin

     TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

      ordfilter := RQOrderFilter.Create;
      SetNullIntProps(ordfilter);
      SetNullXSProps(ordfilter);

      ordfilter.conditionSQL := ' rqorder.code = ( ' +
                                ' select  rqorder.code  from rqorder , rqorderitem ' +
                                '          where rqorder.code = rqorderitem.orderrefcode ' +
                                '           and rqorder.kindrefcode = 4 ' +
                                '           and rqorder.rqordertypecode = 1 ' +
                                '           order by first_day(rqorder.orderperiod) desc ' +
                                '           limit 1 )';


      RQOrderList := TempRQOrder.getScrollableFilteredList(ordfilter, 0, -1);

      if RQOrderList.totalCount = 0  then
      begin
        Application.MessageBox(PChar('Немає зв`язку з EnergyNET !!!'), PChar('Увага'), MB_ICONWARNING);
        exit;
      end;



      maxorderperiod := '1.' +  IntToStr(RQOrderList.list[0].orderPeriod.Month) + '.' +
                              IntToStr(RQOrderList.list[0].orderPeriod.Year) ;

     DecodeDate(date,y,m,d);


    // edtDatePlanFrom.DateTime:= StrToDate('01.01.'+ FloatToStr(y));
    // edtDatePlanTo.DateTime:= StrToDate('31.12.'+ FloatToStr(y));
     edtDateContractFrom.DateTime:= StrToDate('01.01.'+ FloatToStr(y));
     edtDateContractTo.DateTime:= StrToDate('31.12.'+ FloatToStr(y));


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

procedure TfrmDeficitProficit.SpeedButton3Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;


end;

procedure TfrmDeficitProficit.SpeedButton4Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;


end;

end.
