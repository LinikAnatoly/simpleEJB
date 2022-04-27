
unit EditENTravelWorkModeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelWorkModeController ;

type
  TfrmENTravelWorkModeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTravelWorkMode: THTTPRIO;

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
  frmENTravelWorkModeFilterEdit: TfrmENTravelWorkModeFilterEdit;
  ENTravelWorkModeFilterObj: ENTravelWorkModeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelWorkModeController  ;
}
{$R *.dfm}



procedure TfrmENTravelWorkModeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTravelWorkModeObj.name; 


  end;

}

end;



procedure TfrmENTravelWorkModeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelWorkModeFilterObj.name := edtName.Text; 




  end;
end;




end.