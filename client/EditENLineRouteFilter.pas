
unit EditENLineRouteFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLineRouteController ;

type
  TfrmENLineRouteFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblDistancePost : TLabel;
    edtDistancePost: TEdit;



  HTTPRIOENLineRoute: THTTPRIO;

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
  frmENLineRouteFilterEdit: TfrmENLineRouteFilterEdit;
  ENLineRouteFilterObj: ENLineRouteFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLineRouteController  ;
}
{$R *.dfm}



procedure TfrmENLineRouteFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDistancePost
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENLineRouteObj.name; 



    if ( ENLineRouteObj.distancePost <> nil ) then
       edtDistancePost.Text := ENLineRouteObj.distancePost.decimalString
    else
       edtDistancePost.Text := ''; 


  end;

}

end;



procedure TfrmENLineRouteFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENLineRoute: ENLineRouteControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLineRouteFilterObj.name := edtName.Text; 



     if (ENLineRouteFilterObj.distancePost = nil ) then
       ENLineRouteFilterObj.distancePost := TXSDecimal.Create;
     if edtDistancePost.Text <> '' then
       ENLineRouteFilterObj.distancePost.decimalString := edtDistancePost.Text 
     else
       ENLineRouteFilterObj.distancePost := nil;





  end;
end;




end.