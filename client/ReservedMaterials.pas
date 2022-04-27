unit ReservedMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit, InvokeRegistry,
  Rio, SOAPHTTPClient , ChildFormUnit , FINMolDataController ;

type
  TFrmReservedMaterials = class(TDialogForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblFinMolCode: TLabel;
    edtFinMolCode: TEdit;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    lblFinMolName: TLabel;
    edtFinMolName: TEdit;
    HTTPRIOFINMolData: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    Label3: TLabel;
    edtnn: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox2: TGroupBox;
    chkRezerv: TCheckBox;
    chkProv: TCheckBox;
    procedure spbPlanMOLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    parentCode : Integer;
    parentTypeCode : Integer;
    departmentCode : Integer;
    molCode : String;
  end;

var
  FrmReservedMaterials: TFrmReservedMaterials;
  FINMolDataObj: FINMolData;

implementation

{$R *.dfm}
uses FINMolController, ShowFINMol, FINMolTypeController,
  ENDepartment2EPRenController , ENConsts, ENDepartmentController ;

procedure TFrmReservedMaterials.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);

   //if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  departmentCode;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:= TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;

               molCode:= GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TFrmReservedMaterials.FormCreate(Sender: TObject);
begin
  molCode:= '0';
end;

procedure TFrmReservedMaterials.spbPlanMOLClearClick(Sender: TObject);
begin
   edtFinMolCode.Text:= '';
   edtFinMolName.Text := '';
   molCode:= '0';
end;

procedure TFrmReservedMaterials.FormShow(Sender: TObject);
begin
  DisableControls([edtFinMolCode, edtFinMolName]);
end;

end.
