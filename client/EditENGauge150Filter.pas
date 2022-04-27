
unit EditENGauge150Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGauge150Controller ;

type
  TfrmENGauge150FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblDateGauge : TLabel;
    edtDateGauge: TDateTimePicker;
    lblTension : TLabel;
    edtTension: TEdit;

    lblCurrent : TLabel;
    edtCurrent: TEdit;

    lblConsOwnTrans : TLabel;
    edtConsOwnTrans: TEdit;

    lblIsGenSwitchDev : TLabel;
    edtIsGenSwitchDev: TEdit;



  HTTPRIOENGauge150: THTTPRIO;

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
  frmENGauge150FilterEdit: TfrmENGauge150FilterEdit;
  ENGauge150FilterObj: ENGauge150Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGauge150Controller  ;
}
{$R *.dfm}



procedure TfrmENGauge150FilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDateGauge
      ,edtTension
      ,edtCurrent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENGauge150Obj.name; 



      if ENGauge150Obj.dateGauge <> nil then
      begin
        edtDateGauge.DateTime:=EncodeDate(ENGauge150Obj.dateGauge.Year,ENGauge150Obj.dateGauge.Month,ENGauge150Obj.dateGauge.Day);
        edtDateGauge.checked := true;
      end
      else
      begin
        edtDateGauge.DateTime:=SysUtils.Date;
        edtDateGauge.checked := false;
      end;	  



    if ( ENGauge150Obj.tension <> nil ) then
       edtTension.Text := ENGauge150Obj.tension.decimalString
    else
       edtTension.Text := ''; 



    if ( ENGauge150Obj.current <> nil ) then
       edtCurrent.Text := ENGauge150Obj.current.decimalString
    else
       edtCurrent.Text := ''; 



    if ( ENGauge150Obj.consOwnTrans <> nil ) then
       edtConsOwnTrans.Text := ENGauge150Obj.consOwnTrans.decimalString
    else
       edtConsOwnTrans.Text := ''; 



    if ( ENGauge150Obj.isGenSwitchDev <> Low(Integer) ) then
       edtIsGenSwitchDev.Text := IntToStr(ENGauge150Obj.isGenSwitchDev)
    else
       edtIsGenSwitchDev.Text := '';


  end;

}

end;



procedure TfrmENGauge150FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGauge150: ENGauge150ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENGauge150FilterObj.name := edtName.Text; 



     if edtdateGauge.checked then
     begin 
       if ENGauge150FilterObj.dateGauge = nil then
          ENGauge150FilterObj.dateGauge := TXSDateTime.Create;
       ENGauge150FilterObj.dateGauge.XSToNative(GetXSDate(edtdateGauge.DateTime));
     end
     else
       ENGauge150FilterObj.dateGauge := nil;



     if (ENGauge150FilterObj.tension = nil ) then
       ENGauge150FilterObj.tension := TXSDecimal.Create;
     if edtTension.Text <> '' then
       ENGauge150FilterObj.tension.decimalString := edtTension.Text 
     else
       ENGauge150FilterObj.tension := nil;




     if (ENGauge150FilterObj.current = nil ) then
       ENGauge150FilterObj.current := TXSDecimal.Create;
     if edtCurrent.Text <> '' then
       ENGauge150FilterObj.current.decimalString := edtCurrent.Text 
     else
       ENGauge150FilterObj.current := nil;




     if (ENGauge150FilterObj.consOwnTrans = nil ) then
       ENGauge150FilterObj.consOwnTrans := TXSDecimal.Create;
     if edtConsOwnTrans.Text <> '' then
       ENGauge150FilterObj.consOwnTrans.decimalString := edtConsOwnTrans.Text 
     else
       ENGauge150FilterObj.consOwnTrans := nil;




     if ( edtIsGenSwitchDev.Text <> '' ) then
       ENGauge150FilterObj.isGenSwitchDev := StrToInt(edtIsGenSwitchDev.Text)
     else
       ENGauge150FilterObj.isGenSwitchDev := Low(Integer) ;





  end;
end;




end.