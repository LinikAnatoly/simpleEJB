unit repSummaryListMechanic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons , ShowTKTransportReal , TKTransportRealController,
  InvokeRegistry, Rio, SOAPHTTPClient , ENTransportItemController , ChildFormUnit;

type
  TfrmrepSummaryListMechanic = class(TDialogForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    chkBenza: TCheckBox;
    chkDiesel: TCheckBox;
    Memo1: TMemo;
    chkActStatus: TCheckBox;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    GroupBox1: TGroupBox;
    lblSpravMol: TLabel;
    spbSpravMol: TSpeedButton;
    spbSpravMolClear: TSpeedButton;
    edtSpravMol: TEdit;
    dtpDateFinal: TDateTimePicker;
    lblDateStart: TLabel;
    dtpDateStart: TDateTimePicker;
    lblDateFinal: TLabel;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure spbSpravMolClick(Sender: TObject);
    procedure spbSpravMolClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportRealcode : Integer;
    renCode : Integer;
    renName : String;
    codemol : String;
    namemol : String;
    molCode : Integer;
    molName : String;
  end;

var
  frmrepSummaryListMechanic: TfrmrepSummaryListMechanic;
  ENTransportItemObj: ENTransportItem;

implementation

uses DMReportsUnit , ShowENDepartment , ENDepartmentController , FINMolController, ShowFINMol , 
  ShowENSpravMol  ;

{$R *.dfm}

procedure TfrmrepSummaryListMechanic.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   frmENDepartmentShow.isCheckPodr := True;
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmrepSummaryListMechanic.FormCreate(Sender: TObject);
begin
    transportRealcode := 0;
    renCode := 0;
    renName := '';
    Memo1.Text := 'Звіт формується по МВО при умові впровадження ' +
                  'електронних подорожніх листів у підрозділі';
    Memo1.ReadOnly := True;
    molcode := -1;
      // Для удобства сразу сетиться по сегодняшней дате
    SetComboBoxCurrentYear(edtYearGen, 3, 1);
    SetComboBoxCurrentMonth(edtMonthGen);
end;

procedure TfrmrepSummaryListMechanic.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';

end;

procedure TfrmrepSummaryListMechanic.spbPlanMOLClick(Sender: TObject);

var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;


  i: Integer;
 // ENMOL2PlanWorkObj: ENMOL2PlanWork;
  //TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
 // ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
 // ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
begin


f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...
frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               //edtMolName.Text := ENMOL2PlanWorkObj.molName;  //GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1) + GetReturnValue(sgFINMol,0);
               codemol:= GetReturnValue(sgFINMol,0);
               namemol:= GetReturnValue(sgFINMol,1);
               //edtFINMolName.Text := //GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmrepSummaryListMechanic.FormShow(Sender: TObject);
begin
    DisableControls([edtMolName , edtSpravMol]);

end;

procedure TfrmrepSummaryListMechanic.spbPlanMOLClearClick(Sender: TObject);
begin
  edtMolName.Clear;
  codemol:= '';

end;

procedure TfrmrepSummaryListMechanic.spbSpravMolClick(Sender: TObject);
var
   frmENSpravMolShow: TfrmENSpravMolShow;

begin


   frmENSpravMolShow:= TfrmENSpravMolShow.Create(Application,fmNormal);
   try
      with frmENSpravMolShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

          molCode := StrToInt(GetReturnValue(sgENSpravMol,1));
          molName := GetReturnValue(sgENSpravMol,2);
          edtSpravMol.Text := molName;
        end;
      end;
   finally
      frmENSpravMolShow.Free;
   end;

end;

procedure TfrmrepSummaryListMechanic.spbSpravMolClearClick(
  Sender: TObject);
begin

    edtSpravMol.Text:= '';
    molCode:= -1;
    molName := '';

end;

end.
