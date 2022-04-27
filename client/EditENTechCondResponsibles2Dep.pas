
unit EditENTechCondResponsibles2Dep;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechCondResponsibles2DepController ;

type
  TfrmENTechCondResponsibles2DepEdit = class(TDialogForm)

  lblCode : TLabel;
	edtCode : TEdit;
    lbledtENTechCondResponsiblesFIO: TLabel;
    edtENTechCondResponsiblesFIO: TEdit;
    HTTPRIOENTechCondResponsibles2Dep: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENTechCondResponsibles: THTTPRIO;

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
  frmENTechCondResponsibles2DepEdit: TfrmENTechCondResponsibles2DepEdit;
  ENTechCondResponsibles2DepObj: ENTechCondResponsibles2Dep;

implementation

uses
  ENConsts, ShowENDepartment, ENDepartmentController,
  ENTechCondResponsiblesController;

{uses
    EnergyproController, EnergyproController2, ENMol2DepartmentController  ;
}
{$R *.dfm}



procedure TfrmENTechCondResponsibles2DepEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
    TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
    department: ENDepartment;
    ENTechCondResponsiblesObj: ENTechCondResponsibles;
begin
  DisableControls([edtCode, edtENTechCondResponsiblesFIO, edtDepartment]);

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
    edtCode.Text := IntToStr(ENTechCondResponsibles2DepObj.code);

    if ENTechCondResponsibles2DepObj.techCondResponsiblesRef <> nil then
      if ENTechCondResponsibles2DepObj.techCondResponsiblesRef.code <> LOW_INT then
      begin
        TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
        ENTechCondResponsiblesObj := TempENTechCondResponsibles.getObject(ENTechCondResponsibles2DepObj.techCondResponsiblesRef.code);
        if ENTechCondResponsiblesObj <> nil then
        begin
          edtENTechCondResponsiblesFIO.Text := ENTechCondResponsiblesObj.responsibleFIO;
        end;
      end;

    if ENTechCondResponsibles2DepObj.departmentRef <> nil then
    begin
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      department := TempENDepartment.getObject(ENTechCondResponsibles2DepObj.departmentRef.code);
      if department <> nil then
        edtDepartment.Text := department.shortName;
    end;
  end;
end;



procedure TfrmENTechCondResponsibles2DepEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechCondResponsibles2Dep: ENTechCondResponsibles2DepControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtDepartment])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENTechCondResponsibles2Dep := HTTPRIOENTechCondResponsibles2Dep as ENTechCondResponsibles2DepControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENTechCondResponsibles2DepObj.code := low(Integer);
      TempENTechCondResponsibles2Dep.add(ENTechCondResponsibles2DepObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTechCondResponsibles2Dep.save(ENTechCondResponsibles2DepObj);
    end;
  end;
end;


procedure TfrmENTechCondResponsibles2DepEdit.FormCreate(Sender: TObject);
begin
  inherited;

  //enMolCode := LOW_INT;
end;

procedure TfrmENTechCondResponsibles2DepEdit.spbDepartmentClick(Sender: TObject);
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
               if ENTechCondResponsibles2DepObj.departmentRef = nil then ENTechCondResponsibles2DepObj.departmentRef := ENDepartmentRef.Create();
               ENTechCondResponsibles2DepObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
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
