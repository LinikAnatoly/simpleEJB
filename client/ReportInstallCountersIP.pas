unit ReportInstallCountersIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, CheckLst , DialogFormUnit, InvokeRegistry, Rio,
  SOAPHTTPClient, Buttons ;

type
  TfrmReportInstallCountersIP = class(TDialogForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    ListEnPlanWorkType: TCheckListBox;
    HTTPRIOENPlanWorkType: THTTPRIO;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    chkIsIp: TCheckBox;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strPlanWorkType : String;
  end;

var
  frmReportInstallCountersIP: TfrmReportInstallCountersIP;

implementation

uses ENPlanWorkTypeController, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportInstallCountersIP.btnOkClick(Sender: TObject);
var
i : Integer;
argNames, args: ArrayOfString;
reportName: String;
begin
   strPlanWorkType:= '';
   For i:=0 to ListEnPlanWorkType.Count -1  do
    Begin
       if  ListEnPlanWorkType.Checked[i] then
        if strPlanWorkType <>  '' then
           strPlanWorkType := strPlanWorkType + ',' + IntToStr(  Integer( ListEnPlanWorkType.Items.Objects[i] ) )
         else
           strPlanWorkType := strPlanWorkType + IntToStr(  Integer( ListEnPlanWorkType.Items.Objects[i] ) ) ;

    End;

    if ((Length(strPlanWorkType) = 0 ) and ( ListEnPlanWorkType.Visible = True )) then
      begin
          Application.MessageBox(PChar('Необхідно обрати підвид робіт  !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
      end;

      SetLength(argNames, 5);
      SetLength(args, 5);


      argNames[0] := 'datestart';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'datefinal';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'enplanworktype';
      args[2]:=  strPlanWorkType;
      if strPlanWorkType <> '' then
       args[2] :=  ' (  ' + strPlanWorkType + ')'
       else
       args[2] := ' 1 = 1 ';

      argNames[3] := 'isIp';
      if chkIsIp.Checked then
       args[3]:= '1'
      else
       args[3]:= '0';

       reportName:=  'Zbyt/installCounterIP';
       makeReport(reportName , argNames , args , 'xls');




end;

procedure TfrmReportInstallCountersIP.FormShow(Sender: TObject);
var bi : Integer;
planworktypeList: enplanworktypeshortlist;
planworktypeFil : ENPlanWorkTypeFilter;
tempPlanworkType : ENPlanWorkTypeControllerSoapPort;
begin
    ListEnPlanWorkType.Items.Clear;

    planworktypeFil := ENPlanWorkTypeFilter.Create;
    SetNullIntProps(planworktypeFil);
    SetNullXSProps(planworktypeFil);

     planworktypeFil.conditionSQL := '  ENPLANWORKTYPE.code >= 100';
     planworktypeFil.orderBySQL := 'ENPLANWORKTYPE.code';



     tempPlanworkType:= HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
     planworktypeList := tempPlanworkType.getScrollableFilteredList(planworktypeFil,0,-1);

     for bi:=0 to High(planworktypeList.list) do
      begin

        ListEnPlanWorkType.Items.AddObject(planworktypeList.list[bi].name  , TObject( planworktypeList.list[bi].code )  );
      end;
end;

procedure TfrmReportInstallCountersIP.SpeedButton3Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListEnPlanWorkType.Count -1  do
    Begin
       if  ListEnPlanWorkType.Checked[i] = false then
           ListEnPlanWorkType.Checked[i] := true;


    End;


end;

procedure TfrmReportInstallCountersIP.SpeedButton4Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListEnPlanWorkType.Count -1  do
    Begin
       if  ListEnPlanWorkType.Checked[i] = True then
           ListEnPlanWorkType.Checked[i] := False;

    End;


end;

end.
