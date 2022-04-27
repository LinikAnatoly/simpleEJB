unit ReportSizFullDetail;

interface


uses
    Buttons, Controls, Classes, StdCtrls,
    Windows, Messages, SysUtils, Variants, Graphics, Forms,
    Dialogs, DialogFormUnit, ComCtrls, ChildFormUnit;

type
    TfrmReportSizFullDetail = class(TDialogForm)
    lblMaterials: TLabel;
    spbMaterials: TSpeedButton;
    spbMaterialsClear: TSpeedButton;
    edtMaterials: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;

    procedure btnOkClick(Sender: TObject);
    procedure spbMaterialsClick(Sender: TObject);
    procedure spbMaterialsClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    sizMaterialsCode: Integer;
  public
    { Public declarations }
  end;


var
  frmReportSizFullDetail: TfrmReportSizFullDetail;


implementation


uses DMReportsUnit
  , EnergyproController
  , TKMaterialsController
  , ShowTKMaterialsOnly
  , ENConsts

;


{$R *.dfm}



procedure TfrmReportSizFullDetail.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: string;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'sizMaterialsCode';
  args[0] := IntToStr(sizMaterialsCode);

  reportName := 'SZ/siz_full_detail';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmReportSizFullDetail.FormCreate(Sender: TObject);
begin
  inherited;
  sizMaterialsCode := -1;
end;


procedure TfrmReportSizFullDetail.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtMaterials]);
end;


procedure TfrmReportSizFullDetail.spbMaterialsClick(Sender: TObject);
var
  frmTKMaterialsOnlyShow: TfrmTKMaterialsOnlyShow;
  materialsFilter: TKMaterialsFilter;
begin
  inherited;
  materialsFilter := TKMaterialsFilter.Create;
  SetNullIntProps(materialsFilter);
  SetNullXSProps(materialsFilter);
  materialsFilter.conditionSQL := ' tk1.code in ( ' +
        ' select distinct tm.code ' +
        ' from tkelement e, tkelement2techcard t2e, tktechcard tc,  tkmaterials tm ' +
        ' where e.code =  t2e.elementcode ' +
        ' and t2e.techkartcode = tc.code ' +
        ' and e.elementtypecode = ' + IntToStr(TKELEMENTTYPE_MATERIALS) +
        ' and tm.elementcode = e.code ' +
        ' and tc.techcardsourcecode = ' + IntToStr(TKTECHCARDSOURCE_SIZ) +
        ' and tc.megaelementtypecode = 500000115 )';
  materialsFilter.orderBySQL := ' TK1.NAME ';


  frmTKMaterialsOnlyShow := TfrmTKMaterialsOnlyShow.Create(Application, fmNormal, materialsFilter);
  try
    frmTKMaterialsOnlyShow.DisableActions([frmTKMaterialsOnlyShow.actInsert,
                                          frmTKMaterialsOnlyShow.actEdit,
                                          frmTKMaterialsOnlyShow.actDelete,
                                          frmTKMaterialsOnlyShow.actFilter,
                                          frmTKMaterialsOnlyShow.actNoFilter]);

    with frmTKMaterialsOnlyShow do
      if ShowModal = mrOk then
      begin
        try
          sizMaterialsCode := StrToInt(GetReturnValue(sgTKMaterials, 0));
          edtMaterials.Text := GetReturnValue(sgTKMaterials, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmTKMaterialsOnlyShow.Free;
  end;
end;


procedure TfrmReportSizFullDetail.spbMaterialsClearClick(Sender: TObject);
begin
  inherited;
  sizMaterialsCode := -1;
  edtMaterials.Text := '';
end;


end.
