
unit EditENRoadTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRoadTypeController ;

type
  TfrmENRoadTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENRoadType: THTTPRIO;

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
  frmENRoadTypeFilterEdit: TfrmENRoadTypeFilterEdit;
  ENRoadTypeFilterObj: ENRoadTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRoadTypeController  ;
}
{$R *.dfm}



procedure TfrmENRoadTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENRoadTypeObj.name; 


  end;

}

end;



procedure TfrmENRoadTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRoadType: ENRoadTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRoadTypeFilterObj.name := edtName.Text; 




  end;
end;




end.