
unit EditENMol2Department;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMol2DepartmentController ;

type
  TfrmENMol2DepartmentEdit = class(TDialogForm)

  lblCode : TLabel;
	edtCode : TEdit;

  lblENMolMolName : TLabel;
  edtENMolMolName : TEdit;


  HTTPRIOENMol2Department: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //enMolCode: Integer;
  end;

var
  frmENMol2DepartmentEdit: TfrmENMol2DepartmentEdit;
  ENMol2DepartmentObj: ENMol2Department;

implementation

uses
  ShowENMol
  ,ENMolController
, ENConsts, ShowENDepartment, ENDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENMol2DepartmentController  ;
}
{$R *.dfm}



procedure TfrmENMol2DepartmentEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
    department: ENDepartment;
begin
  DisableControls([edtCode, edtENMolMolName, edtDepartment]);

  if (DialogState = dsView) then
  begin
    DisableControls([spbDepartment]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtDepartment]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENMol2DepartmentObj.code);
    if ENMol2DepartmentObj.mol <> nil then
      edtENMolMolName.Text := ENMol2DepartmentObj.mol.name;
    if ENMol2DepartmentObj.departmentRef <> nil then
    begin
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      department := TempENDepartment.getObject(ENMol2DepartmentObj.departmentRef.code);
      if department <> nil then
        edtDepartment.Text := department.shortName;
    end;
  end;
end;



procedure TfrmENMol2DepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMol2Department: ENMol2DepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtDepartment])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENMol2Department := HTTPRIOENMol2Department as ENMol2DepartmentControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENMol2DepartmentObj.code := low(Integer);
      TempENMol2Department.add(ENMol2DepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMol2Department.save(ENMol2DepartmentObj);
    end;
  end;
end;


procedure TfrmENMol2DepartmentEdit.FormCreate(Sender: TObject);
begin
  inherited;
  
  //enMolCode := LOW_INT;
end;

procedure TfrmENMol2DepartmentEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      frmENDepartmentShow.isCheckPodr := true;
      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENMol2DepartmentObj.departmentRef = nil then ENMol2DepartmentObj.departmentRef := ENDepartmentRef.Create();
               ENMol2DepartmentObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
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
