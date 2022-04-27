
unit EditRQPayDocItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPayDocItemController,RQBill2Item2AgItemController,
  AGSpecificationController, AGSpecificationItemController,Math, RQPayDocItem2BillItemController ;

type
  TfrmRQPayDocItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSummaGen : TLabel;
    edtSummaGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIORQPayDocItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblRQBillItem: TLabel;
    edtRQBill: TEdit;
    spbRQBill: TSpeedButton;
    Label1: TLabel;
    edtBillItem: TEdit;
    spbBillItem: TSpeedButton;
    Label2: TLabel;
    edtPayDoc: TEdit;
    spdPayDoc: TSpeedButton;
    Label3: TLabel;
    edtSpecification: TEdit;
    spbSpecification: TSpeedButton;
    Label4: TLabel;
    edtSpecificationItem: TEdit;
    spbSpecificationItem: TSpeedButton;
    HTTPRIORQBill2Item2AgItem: THTTPRIO;
    edtKolvo: TEdit;
    Label5: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRQBillClick(Sender: TObject);
    procedure spbBillItemClick(Sender: TObject);
    procedure spdPayDocClick(Sender: TObject);
    procedure spbSpecificationClick(Sender: TObject);
    procedure spbSpecificationItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
  
  private
    { Private declarations }
  public
   specificationCode: Integer;
   specificationItemCode: Integer;
        SumNDSBill: Double;
     SumBill: Double;
    { Public declarations }

end;

var
  frmRQPayDocItemEdit: TfrmRQPayDocItemEdit;
  RQPayDocItemObj: RQPayDocItem;
  RQPayDocItem2BillItemObj:  RQPayDocItem2BillItem;
  RQBill2Item2AgItemObj: RQBill2Item2AgItem;
  AGSpecificationObj: AGSpecification;

implementation

uses ShowRQBill, RQBillController, RQBillItemController, ShowRQBillItem,
  ShowRQPayDoc, ShowRQPayDocItem,RQPayDocController,Main,
   RQBillItem2ENEstimateItemController,
  RQBillItem2ENEstimateItemStatusController, ShowAGSpecification,
  ShowAGSpecificationItem;


{uses  
    EnergyproController, EnergyproController2, RQPayDocItemController  ;
}
{$R *.dfm}



procedure TfrmRQPayDocItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
     DisableControls([ edtRQBill,edtBillItem,edtSpecification,edtSpecificationItem,edtKolvo]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     edtKolvo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
     DisableControls([ edtRQBill,edtBillItem,edtSpecification,edtSpecificationItem,edtKolvo]);
      edtCode.Text := IntToStr(RQPayDocItemObj.code);
    if ( RQPayDocItemObj.summaGen <> nil ) then
       edtSummaGen.Text := RQPayDocItemObj.summaGen.decimalString
    else
       edtSummaGen.Text := '';
   {   if  ( RQBill2Item2AgItemObj <> nil  ) then
     if ( RQBill2Item2AgItemObj.countGen <> nil ) then
       edtKolvo.Text := RQBill2Item2AgItemObj.countGen.decimalString
    else
       edtKolvo.Text := '';  }    
    edtCommentGen.Text := RQPayDocItemObj.commentGen; 


  end;
end;



procedure TfrmRQPayDocItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
var TempRQBill2Item2AgItem: RQBill2Item2AgItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSummaGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
    TempRQBill2Item2AgItem := HTTPRIORQBill2Item2AgItem as RQBill2Item2AgItemControllerSoapPort;

     if (RQPayDocItemObj.summaGen = nil ) then
       RQPayDocItemObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
     begin
       RQPayDocItemObj.summaGen.decimalString := edtSummaGen.Text ;

     end
     else
       RQPayDocItemObj.summaGen := nil;

     RQPayDocItemObj.commentGen := edtCommentGen.Text;
   if edtSpecification.Text <> '' then begin
    if RQBill2Item2AgItemObj.billItem2EnEsItm = nil then
      RQBill2Item2AgItemObj.billItem2EnEsItm:= RQBillItem2ENEstimateItem.Create;
      if RQBill2Item2AgItemObj.billItem2EnEsItm.billItem = nil then
       RQBill2Item2AgItemObj.billItem2EnEsItm.billItem:= RQBillItem.Create;
      RQBill2Item2AgItemObj.billItem2EnEsItm.billItem.code := StrToInt(edtBillItem.Text); 
      if (RQBill2Item2AgItemObj.countGen = nil ) then
       RQBill2Item2AgItemObj.countGen := TXSDecimal.Create;
      if edtKolvo.Text <> '' then
       RQBill2Item2AgItemObj.countGen.DecimalString :=edtSummaGen.Text ;
   end;
    if DialogState = dsInsert then
    begin
      RQPayDocItemObj.code:=low(Integer);
      TempRQPayDocItem.addPayDocItemList(RQPayDocItemObj,RQPayDocItemObj.summaGen,StrToInt(edtBillItem.Text),RQPayDocItemObj.payDocRef.code , false);
      if  edtSpecification.Text <> '' then
       begin
      RQBill2Item2AgItemObj.code:=low(Integer);
  //    TempRQBill2Item2AgItem.add(RQBill2Item2AgItemObj);
       TempRQBill2Item2AgItem.addBillItem2ENEstimateItemList(RQBill2Item2AgItemObj.billItem2EnEsItm.billItem.code,RQBill2Item2AgItemObj.agItem.code);
      end;
    end
    else
    if DialogState = dsEdit then
    begin
    TempRQPayDocItem.addPayDocItemList(RQPayDocItemObj,RQPayDocItemObj.summaGen,StrToInt(edtBillItem.Text),RQPayDocItemObj.payDocRef.code , false);
     // TempRQPayDocItem.save(RQPayDocItemObj);
       if  edtSpecification.Text <> '' then
       begin
        TempRQBill2Item2AgItem.addBillItem2ENEstimateItemList(RQBill2Item2AgItemObj.billItem2EnEsItm.billItem.code,RQBill2Item2AgItemObj.agItem.code);
       end;
    end;
  end;
end;


procedure TfrmRQPayDocItemEdit.spbRQBillClick(Sender: TObject);
var
   frmRQBillShow: TfrmRQBillShow;
   f : RQBillFilter;
begin
f := RQBillFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   try

   except
      on EConvertError do
       begin
         Application.MessageBox(PChar('Ошибка кода счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Exit;
       end;
   end;
   f.conditionSQL := '  statusrefcode = 3 ';
   frmRQBillShow:=TfrmRQBillShow.Create(Application,fmNormal,f);
   try
      with frmRQBillShow do
        if ShowModal = mrOk then
        begin
            try
             //  if RQPayDocItemObj.billItemRef = nil then RQPayDocItemObj.billItemRef := RQBillItemRef.Create();
              // RQPayDocItemObj.billItemRef.code := StrToInt(GetReturnValue(sgRQBill,0));
               edtRQBill.Text:=GetReturnValue(sgRQBill,0);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQBillShow.Free;
   end;
end;

procedure TfrmRQPayDocItemEdit.spbBillItemClick(Sender: TObject);
var
   frmRQBillItemShow: TfrmRQBillItemShow;
     f : RQBillItemFilter;
     summa,
     //nds,
     summaPayDoc: Double;
begin
if Length( edtRQBill.Text) = 0 then
   begin
    Application.MessageBox(PChar('Необходимо выбрать счет !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
   end;
 f := RQBillItemFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.billRef := RQBillRef.Create;
   try
    f.billRef.code := StrToInt(edtRQBill.Text);
   except
      on EConvertError do
       begin
         Application.MessageBox(PChar('Ошибка кода счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Exit;
       end;
   end;
   f.conditionSQL := '  staterefcode <> 1 ';

   frmRQBillItemShow:=TfrmRQBillItemShow.Create(Application,fmNormal,f);
   try
      with frmRQBillItemShow do
        if ShowModal = mrOk then
        begin
            try
            try
               summa:=0;
               summaPayDoc:=0;
                summa:=StrToFloat(GetReturnValue(sgRQBillItem,7));
                summaPayDoc:=StrToFloat(GetReturnValue(sgRQBillItem,10));
                // NET-4284 тут ндс не используется дальше nds:= summa*0..2;
                // NET-4274 берем сумму сразу с учетом ндс если есть
                summa:=StrToFloat(GetReturnValue(sgRQBillItem,9));

             {   if  RoundTo(summa+nds,-2) > frmRQPayDocItemShow.SummaPayDoc then
                 begin
                   Application.MessageBox(PChar('Сумма позиции не может быть больше суммы оплаты !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                    Exit;
                 end;       }
{                 if  roundTo(summa+nds,-2)+ frmRQPayDocItemShow.SummaGen > frmRQPayDocItemShow.SummaPayDoc then
                 begin
                   Application.MessageBox(PChar('Сумма всех позиций не может быть больше суммы оплаты !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                    Exit;
                 end;  }
                except
               on EConvertError do Exit;
            end;
      //     if RQPayDocItemObj.billItemRef = nil then RQPayDocItemObj.billItemRef := RQBillItemRef.Create();
          if RQPayDocItem2BillItemObj = nil then RQPayDocItem2BillItemObj := RQPayDocItem2BillItem.Create();
             if RQPayDocItem2BillItemObj.billitem = nil then RQPayDocItem2BillItemObj.billItem := RQBillItem.Create();
           //    RQPayDocItemObj.billItemRef.code := StrToInt(GetReturnValue(sgRQBillItem,0));
               RQPayDocItem2BillItemObj.billitem.code := StrToInt(GetReturnValue(sgRQBillItem,0));
                edtBillItem.Text:=GetReturnValue(sgRQBillItem,0);
                // edtSummaGen.Text:= FloatToStr(RoundTo(summa+nds,-2) - summaPayDoc );
                // NET-4274 берем сумму сразу с учетом ндс если есть
                edtSummaGen.Text:= FloatToStr(RoundTo(summa - summaPayDoc,-2) );

                 edtKolvo.Text:=  GetReturnValue(sgRQBillItem,4);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQBillItemShow.Free;
   end;
end;

procedure TfrmRQPayDocItemEdit.spdPayDocClick(Sender: TObject);
var
   frmRQPayDocShow: TfrmRQPayDocShow;
begin
   frmRQPayDocShow:=TfrmRQPayDocShow.Create(Application,fmNormal);
   try
      with frmRQPayDocShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPayDocItemObj.payDocRef = nil then RQPayDocItemObj.payDocRef := RQPayDocRef.Create();
             //  RQPayDocItemObj.billItemRef.code := StrToInt(GetReturnValue(sgRQBill,0));
               edtPayDoc.Text:=GetReturnValue(sgRQPayDoc,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQPayDocShow.Free;
   end;
end;

procedure TfrmRQPayDocItemEdit.spbSpecificationClick(Sender: TObject);
//var
  // frmAGSpecificationShow: TfrmAGSpecificationShow;
begin
   frmAGSpecificationShow:=TfrmAGSpecificationShow.Create(Application,fmNormal);
   try
      with frmAGSpecificationShow do
        if ShowModal = mrOk then
        begin
            try
               specificationCode:=   StrToInt(GetReturnValue(sgAGSpecification,0));
             //  RQPayDocItemObj.billItemRef.code := StrToInt(GetReturnValue(sgRQBill,0));
               edtSpecification.Text:=GetReturnValue(sgAGSpecification,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmAGSpecificationShow.Free;
   end;
end;

procedure TfrmRQPayDocItemEdit.spbSpecificationItemClick(Sender: TObject);
var
    f : AGSpecificationItemFilter;
     frmAGSpecificationItemShow: TfrmAGSpecificationItemShow;
begin
if specificationCode < 0 then
   begin
    Application.MessageBox(PChar('Необходимо выбрать спецификацию !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
   end;
  f := AGSpecificationItemFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.specificationRef := AGSpecificationRef.Create;
  try
    f.specificationRef.code := specificationCode;
   except
      on EConvertError do
       begin
         Application.MessageBox(PChar('Ошибка кода спецификации !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Exit;
       end;
   end;
    frmAGSpecificationItemShow:=TfrmAGSpecificationItemShow.Create(Application,fmNormal,f);
   try
      with frmAGSpecificationItemShow do
        if ShowModal = mrOk then
        begin
            try
               // if RQPayDocItemObj.payDocRef = nil then RQPayDocItemObj.payDocRef := RQPayDocRef.Create();
               if RQBill2Item2AgItemObj = nil then RQBill2Item2AgItemObj:= RQBill2Item2AgItem.Create();
                if RQBill2Item2AgItemObj.agItem = nil then RQBill2Item2AgItemObj.agItem := AGSpecificationItemRef.Create();
                specificationItemCode :=  StrToInt(GetReturnValue(sgAGSpecificationItem,0));
                 RQBill2Item2AgItemObj.agItem.code:=  specificationItemCode ;
             //  RQPayDocItemObj.billItemRef.code := StrToInt(GetReturnValue(sgRQBill,0));
               edtSpecificationItem.Text:=IntToStr(  specificationItemCode );
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmAGSpecificationItemShow.Free;
   end;

end;

procedure TfrmRQPayDocItemEdit.FormCreate(Sender: TObject);
begin
  specificationCode:= Low(Integer);
  specificationItemCode:= Low(Integer);

end;

end.
