
unit EditENSizObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSizObjectController, ENConsts, EnergyproController;

type
    TfrmENSizObjectFilterEdit = class(TDialogForm)

    lblTabNumber : TLabel;
    edtTabNumber: TEdit;

    lblProfesion : TLabel;
    edtProfesion: TMemo;

    lblFio : TLabel;
    edtFio: TEdit;

    lblSizCode : TLabel;
    edtSizCode: TEdit;
    lblEPRenName: TLabel;

    HTTPRIOENSizObject: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    chkShowFired: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure spbEPRenClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSizObjectFilterEdit: TfrmENSizObjectFilterEdit;
  ENSizObjectFilterObj: ENSizObjectFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENEPRen
  ,ShowENDepartment
  ,ENDepartmentController
, DMReportsUnit;


{$R *.dfm}



procedure TfrmENSizObjectFilterEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
    ModalResult := mrOk;
end;


procedure TfrmENSizObjectFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName, edtENDepartmentDepartmentName]);
end;



procedure TfrmENSizObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
  condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
    condition := ENSizObjectFilterObj.conditionSQL;

    ENSizObjectFilterObj.tabNumber := edtTabNumber.Text;
    ENSizObjectFilterObj.profesion := edtProfesion.Text;
    ENSizObjectFilterObj.fio := edtFio.Text;

    if ( edtSizCode.Text <> '' ) then
      ENSizObjectFilterObj.sizCode := StrToInt(edtSizCode.Text)
    else
      ENSizObjectFilterObj.sizCode := Low(Integer) ;

    if chkShowFired.Checked then
      AddCondition(condition, ' ensizobject.statuscode in (' + IntToStr(NO) + ', ' + IntToStr(YES) + ')')
    else
      AddCondition(condition, ' ensizobject.statuscode = ' + IntToStr(NO));

    ENSizObjectFilterObj.conditionSQL := condition;
  end;
  
end;


procedure TfrmENSizObjectFilterEdit.spbEPRenClick(Sender: TObject);
var
  frmEPRenShow: TfrmENEPRenShow;
  condition: String;
begin
  frmEPRenShow := TfrmENEPRenShow.Create(Application,fmNormal);
  try
    with frmEPRenShow do
    if ShowModal = mrOk then
    begin
      try
        condition := ENSizObjectFilterObj.conditionSQL;
        AddCondition(condition, ' enelement.renrefcode = ' + GetReturnValue(sgEPRen, 0));
        edtEPRenName.Text := GetReturnValue(sgEPRen, 1);

        ENSizObjectFilterObj.conditionSQL := condition;
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmEPRenShow.Free;
  end;
end;


procedure TfrmENSizObjectFilterEdit.spbENDepartmentDepartmentClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   frmENDepartmentShow.DisableActions([frmENDepartmentShow.actNoFilter, frmENDepartmentShow.actEdit, frmENDepartmentShow.actInsert,
     frmENDepartmentShow.actDelete, frmENDepartmentShow.actTvDepUpdate]);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
          try
            ENSizObjectFilterObj.departmentRef := ENDepartmentRef.Create;
            ENSizObjectFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
            edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
          except
             on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


end.

