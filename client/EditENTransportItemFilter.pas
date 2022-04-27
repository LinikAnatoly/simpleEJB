
unit EditENTransportItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportItemController ;

type
  TfrmENTransportItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblPrice : TLabel;
    edtPrice: TEdit;
    lblCost : TLabel;
    edtCost: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKTransportRealTransportRealName : TLabel;
  edtTKTransportRealTransportRealName : TEdit;
  spbTKTransportRealTransportReal : TSpeedButton;
  
  lblENManningTableManningTableName : TLabel;
  edtENManningTableManningTableName : TEdit;
  spbENManningTableManningTable : TSpeedButton;
  
  lblENWorkerWorkerFactName : TLabel;
  edtENWorkerWorkerFactName : TEdit;
  spbENWorkerWorkerFact : TSpeedButton;
  

  HTTPRIOENTransportItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealTransportRealClick(Sender : TObject);
  procedure spbENManningTableManningTableClick(Sender : TObject);
  procedure spbENWorkerWorkerFactClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportItemFilterEdit: TfrmENTransportItemFilterEdit;
  ENTransportItemFilterObj: ENTransportItemFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
  ,ShowENManningTable
  ,ENManningTableController
  ,ShowENWorker
  ,ENWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportItemController  ;
}
{$R *.dfm}



procedure TfrmENTransportItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENTransportItemObj.countGen <> nil ) then
       edtCountGen.Text := ENTransportItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENTransportItemObj.countFact <> nil ) then
       edtCountFact.Text := ENTransportItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( ENTransportItemObj.price <> nil ) then
       edtPrice.Text := ENTransportItemObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( ENTransportItemObj.cost <> nil ) then
       edtCost.Text := ENTransportItemObj.cost.decimalString
    else
       edtCost.Text := ''; 



    edtCommentGen.Text := ENTransportItemObj.commentGen; 



    edtUserGen.Text := ENTransportItemObj.userGen; 



      if ENTransportItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportItemObj.dateEdit.Year,ENTransportItemObj.dateEdit.Month,ENTransportItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmENTransportItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportItem: ENTransportItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENTransportItemFilterObj.countWorkGen = nil ) then
       ENTransportItemFilterObj.countWorkGen := TXSDecimal.Create;
     ENTransportItemFilterObj.countWorkGen.decimalString := edtCountGen.Text ;



     if (ENTransportItemFilterObj.countWorkFact = nil ) then
       ENTransportItemFilterObj.countWorkFact := TXSDecimal.Create;
     ENTransportItemFilterObj.countWorkFact.decimalString := edtCountFact.Text ;



     if (ENTransportItemFilterObj.price = nil ) then
       ENTransportItemFilterObj.price := TXSDecimal.Create;
     ENTransportItemFilterObj.price.decimalString := edtPrice.Text ;



     if (ENTransportItemFilterObj.cost = nil ) then
       ENTransportItemFilterObj.cost := TXSDecimal.Create;
     ENTransportItemFilterObj.cost.decimalString := edtCost.Text ;



     ENTransportItemFilterObj.commentGen := edtCommentGen.Text; 



     ENTransportItemFilterObj.userGen := edtUserGen.Text; 



     if ENTransportItemFilterObj.dateEdit = nil then
        ENTransportItemFilterObj.dateEdit := TXSDate.Create;
      ENTransportItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmENTransportItemFilterEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemFilterObj.transportReal = nil then ENTransportItemFilterObj.transportReal := TKTransportReal.Create();
               ENTransportItemFilterObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;


procedure TfrmENTransportItemFilterEdit.spbENManningTableManningTableClick(Sender : TObject);
var 
   frmENManningTableShow: TfrmENManningTableShow;
begin
{
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemFilterObj.manningTable = nil then ENTransportItemFilterObj.manningTable := ENManningTable.Create();
               ENTransportItemFilterObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManningTableShow.Free;
   end;
}   
end;


procedure TfrmENTransportItemFilterEdit.spbENWorkerWorkerFactClick(Sender : TObject);
var 
   frmENWorkerShow: TfrmENWorkerShow;
begin
{
   frmENWorkerShow:=TfrmENWorkerShow.Create(Application,fmNormal);
   try
      with frmENWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemFilterObj.workerFact = nil then ENTransportItemFilterObj.workerFact := ENWorker.Create();
               ENTransportItemFilterObj.workerFact.code := StrToInt(GetReturnValue(sgENWorker,0));
               edtENWorkerWorkerFactName.Text:=GetReturnValue(sgENWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkerShow.Free;
   end;
}   
end;





end.