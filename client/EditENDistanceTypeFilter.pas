
unit EditENDistanceTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistanceTypeController ;

type
  TfrmENDistanceTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDistanceType: THTTPRIO;

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
  frmENDistanceTypeFilterEdit: TfrmENDistanceTypeFilterEdit;
  ENDistanceTypeFilterObj: ENDistanceTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDistanceTypeController  ;
}
{$R *.dfm}



procedure TfrmENDistanceTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDistanceTypeObj.name; 


  end;

}

end;



procedure TfrmENDistanceTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistanceType: ENDistanceTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDistanceTypeFilterObj.name := edtName.Text; 




  end;
end;




end.