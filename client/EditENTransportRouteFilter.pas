
unit EditENTransportRouteFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRouteController ;

type
  TfrmENTransportRouteFilterEdit = class(TDialogForm)

    lblDistance : TLabel;
    edtDistance: TEdit;

    lblWeight : TLabel;
    edtWeight: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;



  HTTPRIOENTransportRoute: THTTPRIO;

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
  frmENTransportRouteFilterEdit: TfrmENTransportRouteFilterEdit;
  ENTransportRouteFilterObj: ENTransportRouteFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportRouteController  ;
}
{$R *.dfm}



procedure TfrmENTransportRouteFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENTransportRouteObj.distance <> nil ) then
       edtDistance.Text := ENTransportRouteObj.distance.decimalString
    else
       edtDistance.Text := ''; 



    if ( ENTransportRouteObj.weight <> nil ) then
       edtWeight.Text := ENTransportRouteObj.weight.decimalString
    else
       edtWeight.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENTransportRouteObj.commentGen);



      if ENTransportRouteObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportRouteObj.dateEdit.Year,ENTransportRouteObj.dateEdit.Month,ENTransportRouteObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := ENTransportRouteObj.userGen; 


  end;

}

end;



procedure TfrmENTransportRouteFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRoute: ENTransportRouteControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENTransportRouteFilterObj.distance = nil ) then
       ENTransportRouteFilterObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENTransportRouteFilterObj.distance.decimalString := edtDistance.Text 
     else
       ENTransportRouteFilterObj.distance := nil;




     if (ENTransportRouteFilterObj.weight = nil ) then
       ENTransportRouteFilterObj.weight := TXSDecimal.Create;
     if edtWeight.Text <> '' then
       ENTransportRouteFilterObj.weight.decimalString := edtWeight.Text 
     else
       ENTransportRouteFilterObj.weight := nil;




     ENTransportRouteFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENTransportRouteFilterObj.dateEdit = nil then
          ENTransportRouteFilterObj.dateEdit := TXSDateTime.Create;
       ENTransportRouteFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportRouteFilterObj.dateEdit := nil;



     ENTransportRouteFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.