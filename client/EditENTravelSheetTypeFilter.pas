
unit EditENTravelSheetTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetTypeController ;

type
  TfrmENTravelSheetTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTravelSheetType: THTTPRIO;

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
  frmENTravelSheetTypeFilterEdit: TfrmENTravelSheetTypeFilterEdit;
  ENTravelSheetTypeFilterObj: ENTravelSheetTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetTypeController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTravelSheetTypeObj.name; 


  end;

}

end;



procedure TfrmENTravelSheetTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelSheetTypeFilterObj.name := edtName.Text; 




  end;
end;




end.