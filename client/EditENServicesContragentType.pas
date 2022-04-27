
unit EditENServicesContragentType;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENServicesContragentTypeController;

type
  TfrmENServicesContragentTypeEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
  cbContragentType: TComboBox;
  lblContragentType: TLabel;
  lblWarning: TLabel;

  procedure FormShow(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesContragentTypeEdit: TfrmENServicesContragentTypeEdit;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesContragentTypeController  ;
}
{$R *.dfm}



procedure TfrmENServicesContragentTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
    //
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    //
    //
  end;
end;



end.
