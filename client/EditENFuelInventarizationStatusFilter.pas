
unit EditENFuelInventarizationStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationStatusController ;

type
  TfrmENFuelInventarizationStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENFuelInventarizationStatus: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuelInventarizationStatusFilterEdit: TfrmENFuelInventarizationStatusFilterEdit;
  ENFuelInventarizationStatusFilterObj: ENFuelInventarizationStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationStatusController  ;
}
{$R *.dfm}



procedure TfrmENFuelInventarizationStatusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENFuelInventarizationStatusObj.name; 


  end;

}

end;



procedure TfrmENFuelInventarizationStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuelInventarizationStatusFilterObj.name := edtName.Text; 




  end;
end;




end.