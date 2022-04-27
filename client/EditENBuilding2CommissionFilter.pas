
unit EditENBuilding2CommissionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilding2CommissionController ;

type
  TfrmENBuilding2CommissionFilterEdit = class(TDialogForm)

    lblTabNumber : TLabel;
    edtTabNumber: TEdit;

    lblFIO : TLabel;
    edtFIO: TEdit;

    lblShortFIO : TLabel;
    edtShortFIO: TEdit;

    lblPositionName : TLabel;
    edtPositionName: TMemo;



  HTTPRIOENBuilding2Commission: THTTPRIO;

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
  frmENBuilding2CommissionFilterEdit: TfrmENBuilding2CommissionFilterEdit;
  ENBuilding2CommissionFilterObj: ENBuilding2CommissionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuilding2CommissionController  ;
}
{$R *.dfm}



procedure TfrmENBuilding2CommissionFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTabNumber
      ,edtPositionName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtTabNumber.Text := ENBuilding2CommissionObj.tabNumber; 



    edtFIO.Text := ENBuilding2CommissionObj.FIO; 



    edtShortFIO.Text := ENBuilding2CommissionObj.shortFIO; 



    MakeMultiline(edtPositionName.Lines, ENBuilding2CommissionObj.positionName);


  end;

}

end;



procedure TfrmENBuilding2CommissionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBuilding2CommissionFilterObj.tabNumber := edtTabNumber.Text; 



     ENBuilding2CommissionFilterObj.FIO := edtFIO.Text; 



     ENBuilding2CommissionFilterObj.shortFIO := edtShortFIO.Text; 



     ENBuilding2CommissionFilterObj.positionName := edtPositionName.Text; 




  end;
end;




end.