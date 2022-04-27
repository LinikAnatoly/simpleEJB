
unit EditENTrafficGPSFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTrafficGPSController ;

type
  TfrmENTrafficGPSFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblSumKm : TLabel;
    edtSumKm: TEdit;

    lblSumFuel : TLabel;
    edtSumFuel: TEdit;


  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTrafficGPS: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTrafficGPSFilterEdit: TfrmENTrafficGPSFilterEdit;
  ENTrafficGPSFilterObj: ENTrafficGPSFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTrafficGPSController  ;
}
{$R *.dfm}



procedure TfrmENTrafficGPSFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENTrafficGPSObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTrafficGPSObj.dateGen.Year,ENTrafficGPSObj.dateGen.Month,ENTrafficGPSObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENTrafficGPSObj.sumKm <> nil ) then
       edtSumKm.Text := ENTrafficGPSObj.sumKm.decimalString
    else
       edtSumKm.Text := ''; 



    if ( ENTrafficGPSObj.sumFuel <> nil ) then
       edtSumFuel.Text := ENTrafficGPSObj.sumFuel.decimalString
    else
       edtSumFuel.Text := ''; 


  end;

}

end;



procedure TfrmENTrafficGPSFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENTrafficGPSFilterObj.dateGen = nil then
          ENTrafficGPSFilterObj.dateGen := TXSDate.Create;
       ENTrafficGPSFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTrafficGPSFilterObj.dateGen := nil;



     if (ENTrafficGPSFilterObj.sumKm = nil ) then
       ENTrafficGPSFilterObj.sumKm := TXSDecimal.Create;
     if edtSumKm.Text <> '' then
       ENTrafficGPSFilterObj.sumKm.decimalString := edtSumKm.Text 
     else
       ENTrafficGPSFilterObj.sumKm := nil;




     if (ENTrafficGPSFilterObj.sumFuel = nil ) then
       ENTrafficGPSFilterObj.sumFuel := TXSDecimal.Create;
     if edtSumFuel.Text <> '' then
       ENTrafficGPSFilterObj.sumFuel.decimalString := edtSumFuel.Text 
     else
       ENTrafficGPSFilterObj.sumFuel := nil;





  end;
end;

procedure TfrmENTrafficGPSFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTrafficGPSFilterObj.realTransport = nil then ENTrafficGPSFilterObj.realTransport := TKTransportReal.Create();
               ENTrafficGPSFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;





end.