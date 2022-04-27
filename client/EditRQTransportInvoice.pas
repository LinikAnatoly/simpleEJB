
unit EditRQTransportInvoice;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTransportInvoiceController, RQTransportInvoiceItemController,
  ExtCtrls ;

type
  TfrmRQTransportInvoiceEdit = class(TDialogForm)
    pcRQTransportInvoice: TPageControl;
    tsRQTransportInvoice: TTabSheet;
    grp1: TGroupBox;
    dtpDatePostings: TDateTimePicker;
    tsRQTransportInvoiceItems: TTabSheet;
    tlb1: TToolBar;
    btnAddMaterial: TToolButton;
    btnDeleteMaterial: TToolButton;
    sgRQTransportInvoiceItem: TAdvStringGrid;
    lblNumberDoc: TLabel;
    edtNumberDoc: TEdit;
    lblNumberProject: TLabel;
    edtNumberProject: TEdit;
    lblDateGen: TLabel;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    lblUserGen: TLabel;
    edtUserGen: TEdit;
    lblDateEdit: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    edtDateGen: TDateTimePicker;
    edtDateEdit: TDateTimePicker;
    HTTPRIORQTransportInvoice: THTTPRIO;
    edtCode: TEdit;
    lblCode: TLabel;
    btnEditMaterial: TToolButton;
    HTTPRIORQTransportInvoiceItem: THTTPRIO;
    actlst1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    btnUpdate: TToolButton;
    il1: TImageList;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    lblAllWeight: TLabel;
    pnlTotalWeight: TPanel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

  ENPlanWorkCode : Integer;
  procedure UpdateGrid(Sender: TObject);


end;

var
  frmRQTransportInvoiceEdit: TfrmRQTransportInvoiceEdit;
  RQTransportInvoiceObj: RQTransportInvoice;


  RQTransportInvoiceItemHeaders: array [1..5] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'Кількість'
          ,'Вага, кг'
        );

implementation



uses
    EditRQTransportInvoiceItem  ;

{$R *.dfm}



procedure TfrmRQTransportInvoiceEdit.FormShow(Sender: TObject);
var
    TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
  RQTransportInvoiceItemList: RQTransportInvoiceItemShortList;
  RQTransportInvoiceItemFilterObj : RQTransportInvoiceItemFilter;
  i: Integer;
  itemWeight, totalWeight: Double;

begin

  if DialogState = dsView then
  begin
    DisableActions([actInsert, actDelete, actEdit],True);
  end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQTransportInvoiceObj.code);
    edtNumberDoc.Text := RQTransportInvoiceObj.numberDoc; 
    edtNumberProject.Text := RQTransportInvoiceObj.numberProject; 
      if RQTransportInvoiceObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQTransportInvoiceObj.dateGen.Year,RQTransportInvoiceObj.dateGen.Month,RQTransportInvoiceObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtCommentGen.Text := RQTransportInvoiceObj.commentGen; 

  end;

//  if pcRQTransportInvoice.ActivePage = tsRQTransportInvoiceItems then
//  begin
     RQTransportInvoiceItemFilterObj := RQTransportInvoiceItemFilter.Create;
         SetNullIntProps(RQTransportInvoiceItemFilterObj);
         SetNullXSProps(RQTransportInvoiceItemFilterObj);
         RQTransportInvoiceItemFilterObj.transportInvoiceRef := RQTransportInvoiceRef.Create;
         RQTransportInvoiceItemFilterObj.transportInvoiceRef.code := RQTransportInvoiceObj.code;

         TempRQTransportInvoiceItem :=  HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
         SetGridHeaders(RQTransportInvoiceItemHeaders, sgRQTransportInvoiceItem.ColumnHeaders);

          RQTransportInvoiceItemList := TempRQTransportInvoiceItem.getScrollableFilteredList(RQTransportInvoiceItemFilterObj,0,-1);

            if High(RQTransportInvoiceItemList.list) > -1 then
               sgRQTransportInvoiceItem.RowCount:=High(RQTransportInvoiceItemList.list)+2
            else
               sgRQTransportInvoiceItem.RowCount:=2;

            itemWeight:= 0;
            totalWeight:= 0;   

             with sgRQTransportInvoiceItem do
              for i:=0 to High(RQTransportInvoiceItemList.list) do
                begin

                    if RQTransportInvoiceItemList.list[i].code <> Low(Integer) then
                    Cells[0,i+1] := IntToStr(RQTransportInvoiceItemList.list[i].code)
                    else
                    Cells[0,i+1] := '';

                    Cells[1, i+1] := RQTransportInvoiceItemList.list[i].materialName;
                    Cells[2, i+1] := RQTransportInvoiceItemList.list[i].measurementName;

                    if RQTransportInvoiceItemList.list[i].countFact = nil then
                      Cells[3,i+1] := ''
                    else
                    begin
                      Cells[3,i+1] := RQTransportInvoiceItemList.list[i].countFact.DecimalString;
                    end;

                    if (RQTransportInvoiceItemList.list[i].weight = nil) then
                      Cells[4,i+1] := ''
                    else
                    begin
                     Cells[4,i+1] := RQTransportInvoiceItemList.list[i].weight.DecimalString;
                      try
                        itemWeight := StrToFloat(RQTransportInvoiceItemList.list[i].weight.DecimalString);
                      except
                        itemWeight := 0;
                      end;
                    end;

                      totalWeight := totalWeight + itemWeight;

                       sgRQTransportInvoiceItem.RowCount:= i + 2;

                    end;

             sgRQTransportInvoiceItem.Row:=1;

             pnlTotalWeight.Caption := SeparateThousands(FloatToStr(Conv(totalWeight, 2)));


//    end;


  end;

procedure TfrmRQTransportInvoiceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  begin
    TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;


    edtNumberDoc.Text := 'Auto';
     RQTransportInvoiceObj.numberDoc := edtNumberDoc.Text;

     RQTransportInvoiceObj.numberProject := edtNumberProject.Text;

     if edtdateGen.checked then
     begin 
       if RQTransportInvoiceObj.dateGen = nil then
          RQTransportInvoiceObj.dateGen := TXSDate.Create;
       RQTransportInvoiceObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQTransportInvoiceObj.dateGen := nil;

     RQTransportInvoiceObj.commentGen := edtCommentGen.Text; 

     RQTransportInvoiceObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if RQTransportInvoiceObj.dateEdit = nil then
          RQTransportInvoiceObj.dateEdit := TXSDateTime.Create;
       RQTransportInvoiceObj.dateEdit.XSToNative(GetXSDateTime(edtdateEdit.DateTime));
     end
     else
       RQTransportInvoiceObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      RQTransportInvoiceObj.code:=low(Integer);
      TempRQTransportInvoice.add(RQTransportInvoiceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQTransportInvoice.save(RQTransportInvoiceObj);
    end;
  end;
end;


procedure TfrmRQTransportInvoiceEdit.actInsertExecute(Sender: TObject);

var frmRQTransportInvoiceItemEdit: TfrmRQTransportInvoiceItemEdit;
   TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
   TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
   rqTransportInvoiceCode : Integer;
begin

     if ((DialogState = dsInsert) and (RQTransportInvoiceObj.code = 0)) then
    begin
      RQTransportInvoiceObj.code:=low(Integer);
      RQTransportInvoiceObj.numberDoc:='Auto';
      TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;
      rqTransportInvoiceCode:= TempRQTransportInvoice.add(RQTransportInvoiceObj);
      RQTransportInvoiceObj := TempRQTransportInvoice.getObject(rqTransportInvoiceCode);
      DialogState := dsEdit;
      FormShow(Sender);
    end;

    TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
    RQTransportInvoiceItemObj := RQTransportInvoiceItem.Create;

    RQTransportInvoiceItemObj.countFact := TXSDecimal.Create;

    RQTransportInvoiceItemObj.dateEdit := TXSDate.Create;

    RQTransportInvoiceItemObj.transportInvoiceRef := RQTransportInvoiceRef.Create;
    RQTransportInvoiceItemObj.transportInvoiceRef.code := RQTransportInvoiceObj.code;

try
      frmRQTransportInvoiceItemEdit := TfrmRQTransportInvoiceItemEdit.Create(Application, dsInsert);
//      frmRQTransportInvoiceItemEdit.RQTransportInvoiceCode := RQTransportInvoiceObj.code;

      try
        if frmRQTransportInvoiceItemEdit.ShowModal = mrOk then
        begin
          if  RQTransportInvoiceItemObj <> nil then
            UpdateGrid(Sender);
        end;
      finally
        frmRQTransportInvoiceItemEdit.Free;
        frmRQTransportInvoiceItemEdit := nil;
      end;
    finally
      RQTransportInvoiceItemObj.Free;
    end;


end;

procedure TfrmRQTransportInvoiceEdit.actDeleteExecute(
  Sender: TObject);
  var
  TempRQTransportInvoiceItem : RQTransportInvoiceItemControllerSoapPort;
  ObjCode : Integer;
begin

  TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункт т/т накладної) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQTransportInvoiceItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQTransportInvoiceEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQTransportInvoiceItem.RowCount-1 do
   for j:=0 to sgRQTransportInvoiceItem.ColCount-1 do
     sgRQTransportInvoiceItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQTransportInvoiceEdit.actEditExecute(Sender: TObject);
Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
 TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     RQTransportInvoiceItemObj := TempRQTransportInvoiceItem.getObject(StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceItemEdit:=TfrmRQTransportInvoiceItemEdit.Create(Application, dsEdit);
  try
    if frmRQTransportInvoiceItemEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
  finally
    frmRQTransportInvoiceItemEdit.Free;
    frmRQTransportInvoiceItemEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceEdit.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQTransportInvoiceEdit.actViewExecute(Sender: TObject);
Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
 TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     RQTransportInvoiceItemObj := TempRQTransportInvoiceItem.getObject(StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceItemEdit:=TfrmRQTransportInvoiceItemEdit.Create(Application, dsView);
  try
    frmRQTransportInvoiceItemEdit.ShowModal;
  finally
    frmRQTransportInvoiceItemEdit.Free;
    frmRQTransportInvoiceItemEdit:=nil;
  end;
end;

end.
