
unit EditENCheckpointFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointController ;

type
  TfrmENCheckpointFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENCheckpoint: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtENTransportDepartment: TEdit;
    lblENTransportDepartment: TLabel;
    spbENCheckpoint: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENCheckpointClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCheckpointFilterEdit: TfrmENCheckpointFilterEdit;
  ENCheckpointFilterObj: ENCheckpointFilter;

implementation


uses
  ENTransportDepartmentController
  , ShowENTransportDepartment;

{$R *.dfm}



procedure TfrmENCheckpointFilterEdit.FormShow(Sender: TObject);

begin
    DisableControls([edtENTransportDepartment]);
end;



procedure TfrmENCheckpointFilterEdit.spbENCheckpointClick(Sender: TObject);
var
  frmTransportDep : TfrmENTransportDepartmentShow;
begin
  inherited;
  frmTransportDep := TfrmENTransportDepartmentShow.Create(Application,fmNormal);
  try
    with frmTransportDep do
    if ShowModal = mrOk then
    begin
      try
         if ENCheckpointFilterObj.transportDepartmentRef = nil then ENCheckpointFilterObj.transportDepartmentRef := ENTransportDepartmentRef.Create;
         ENCheckpointFilterObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
         edtENTransportDepartment.Text := GetReturnValue(sgENTransportDepartment,1);
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmTransportDep.Free;
  end;
end;

procedure TfrmENCheckpointFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpoint: ENCheckpointControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCheckpointFilterObj.name := edtName.Text; 




  end;
end;




end.