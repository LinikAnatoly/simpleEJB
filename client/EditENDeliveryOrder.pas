
unit EditENDeliveryOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryOrderController
    ,ENTransportItemController
  ;

type
  TfrmENDeliveryOrderEdit = class(TDialogForm)

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENTransportItemTransportOutName : TLabel;
  edtENTransportItemTransportOutName : TEdit;
  spbENTransportItemTransportOut : TSpeedButton;
  

  HTTPRIOENDeliveryOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransportItemTransportOutClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    inTransport : ENTransportItem;


end;

var
  frmENDeliveryOrderEdit: TfrmENDeliveryOrderEdit;
  ENDeliveryOrderObj: ENDeliveryOrder;

implementation

uses
  ShowENTransportItem

, FINWorkerController, TKTransportRealController;

{uses  
    EnergyproController, EnergyproController2, ENDeliveryOrderController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryOrderEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    MakeMultiline(edtCommentGen.Lines, ENDeliveryOrderObj.commentGen);

    //edtENTransportItemTransportOutName.Text := ENDeliveryOrderObj.transportOut.name;

  end;
end;



procedure TfrmENDeliveryOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
        edtENTransportItemTransportOutName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;


     ENDeliveryOrderObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENDeliveryOrderObj.code:=low(Integer);
      TempENDeliveryOrder.add(ENDeliveryOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDeliveryOrder.save(ENDeliveryOrderObj);
    end;
  end;
end;


procedure TfrmENDeliveryOrderEdit.spbENTransportItemTransportOutClick(Sender : TObject);
var 
   frmENTransportItemShow: TfrmENTransportItemShow;
   f : ENTransportItemFilter;
begin
      f := ENTransportItemFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);
      //f.finWorker := FINWorker.Create;
      //f.finWorker.code := inTransport.finWorker.code;
      f.transportReal := TKTransportReal.Create;
      f.transportReal.code := inTransport.transportReal.code;
      f.conditionSQL := 'entransportitem.planrefcode in ('+

      'select p1.code from enplanwork p1, enplanwork p2 where '+
      'p2.code = '+ IntToStr(inTransport.planRef.code) +
      ' and p2.kindcode = p1.kindcode and p1.datestart = p2.datestart ' +
      ')'+
        ' and entransportitem.code in (select endistance.transportitemrefcode from endistance )'+
        ' and entransportitem.planrefcode <> ' + IntToStr(inTransport.planRef.code) +
        /// 22.04.11 не выбирать из обнуленных работ !!!!!
        ' and entransportitem.planitemrefcode not in ' +
            '(select pwi.code from enplanworkitem pwi where pwi.planrefcode = entransportitem.planrefcode and pwi.countgen = 0) ' +
        ///
        ' and entransportitem.code not in (select endeliveryorder.transportoutcode from endeliveryorder)'+
        '';

   frmENTransportItemShow:=TfrmENTransportItemShow.Create(Application,fmNormal,f);
   try
      frmENTransportItemShow.DisableActions([ frmENTransportItemShow.actInsert, frmENTransportItemShow.actDelete, frmENTransportItemShow.actEdit, frmENTransportItemShow.actFilter, frmENTransportItemShow.actNoFilter ]);
      with frmENTransportItemShow do

        if ShowModal = mrOk then
        begin
            try
               if ENDeliveryOrderObj.transportOut = nil then ENDeliveryOrderObj.transportOut := ENTransportItem.Create();
               ENDeliveryOrderObj.transportOut.code := StrToInt(GetReturnValue(sgENTransportItem,0));
               edtENTransportItemTransportOutName.Text:=GetReturnValue(sgENTransportItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportItemShow.Free;
   end;
end;



end.