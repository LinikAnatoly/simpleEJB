
unit EditENTiresInstallPlacesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTiresInstallPlacesController ;

type
  TfrmENTiresInstallPlacesFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTiresInstallPlaces: THTTPRIO;

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
  frmENTiresInstallPlacesFilterEdit: TfrmENTiresInstallPlacesFilterEdit;
  ENTiresInstallPlacesFilterObj: ENTiresInstallPlacesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTiresInstallPlacesController  ;
}
{$R *.dfm}



procedure TfrmENTiresInstallPlacesFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTiresInstallPlacesObj.name; 


  end;

}

end;



procedure TfrmENTiresInstallPlacesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTiresInstallPlacesFilterObj.name := edtName.Text; 




  end;
end;




end.