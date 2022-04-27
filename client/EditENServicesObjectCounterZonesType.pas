unit EditENServicesObjectCounterZonesType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , DialogFormUnit, ChildFormUnit
  ,ENPlanWorkController, Buttons, StdCtrls, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient
  ,XSBuiltIns
  ,ENServicesObjectController
  ;

type
  TfrmEditENServicesObjectCounterZonesType = class(TDialogForm)
    btnCancel: TButton;
    btnOk: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    lblPK: TLabel;
    edtCode: TEdit;
    lblEnElement: TLabel;
    cmbCounterZonesType: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
      servicesObject: ENServicesObject;
  end;

var
  frmEditENServicesObjectCounterZonesType: TfrmEditENServicesObjectCounterZonesType;



implementation

uses ENConsts, ShowFINExecutorTree, FINExecutorController,
  FINMolController, ShowFINMol, ENDepartment2EPRenController,
   ENDepartmentController, ShowENDepartment, ShowENElement
   , ENElementController, ShowENPlanWorkState, ENPlanWorkStateController
   , ShowENServicesConnection
   , DMReportsUnit;


{$R *.dfm}


procedure TfrmEditENServicesObjectCounterZonesType.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
	TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  inherited;
  if (ModalResult = mrOk) then begin
  {Если на вопрос ответили отрицательно, то выход из процедуры}
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити кількість зон лічильника'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<>IDOK then begin

      Action := caNone;
      Exit;
  end;
    servicesObject.countersZoneType := cmbCounterZonesType.ItemIndex+1;
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
	  TempENServicesObject.updateCounterZonesType(servicesObject);
	  Application.MessageBox(PChar('Кількість зон лічильника за договором змінена!')
    , PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmEditENServicesObjectCounterZonesType.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtCode]);

  edtCode.Text := IntToStr(servicesObject.code);

  cmbCounterZonesType.ItemIndex := servicesObject.countersZoneType - 1;
end;

end.


