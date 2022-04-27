unit ShowSCSeal2ENWorkOrderBytForFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Grids, AdvObj, BaseGrid, AdvGrid,
  Menus, ActnList, Rio, SOAPHTTPClient, ImgList, ComCtrls, ToolWin;

type
  TfrmSCSeal2ENWorkOrderBytForFactShow = class(TChildForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    HTTPRIOSCSeal2ENWorkOrderByt: THTTPRIO;
    ActionList1: TActionList;
    actSelect: TAction;
    actUpdate: TAction;
    sgSCSeal2ENWorkOrderByt: TAdvStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    estimateItemCodes: String;
    workOrderBytCode: Integer;
    sealTypeCode: Integer;
  end;

//var
//  frmSCSeal2ENWorkOrderBytForFactShow: TfrmSCSeal2ENWorkOrderBytForFactShow;

implementation

uses ENConsts, SCSeal2ENWorkOrderBytController, GridHeadersUnit, XSBuiltIns,
  DialogFormUnit;

{$R *.dfm}

var
  SCSeal2ENWorkOrderBytHeaders: array [1..7] of String =
        ( 'Код'
          ,'Коды enestimateitem'
          ,'Особ. рах. / № дог.'
          ,'ПІБ абонента'
          ,'ПІБ абонента' // название для передачи на сервер (скрытый столбец)
          //,'Матеріал у плані'
          ,'Кількість пломб у плані'
          ,'Прив''язано пломб'
        );
        
procedure TfrmSCSeal2ENWorkOrderBytForFactShow.actSelectExecute(
  Sender: TObject);
begin
  if FormMode = fmNormal then
  begin
    estimateItemCodes := GetReturnValue(sgSCSeal2ENWorkOrderByt, 1);

    if estimateItemCodes = '' then
    begin
      Application.MessageBox(PChar('NET-4350 Не заданий перелік пломб у плані! Прив''язка неможлива!'),
                             PChar('Увага!'), MB_ICONWARNING);
      ModalResult := mrNone;
      Exit;
    end;

    ModalResult := mrOk;
  end;
end;

procedure TfrmSCSeal2ENWorkOrderBytForFactShow.FormCreate(Sender: TObject);
begin
  workOrderBytCode := LOW_INT;
  sealTypeCode := LOW_INT;
  estimateItemCodes := '';
end;

procedure TfrmSCSeal2ENWorkOrderBytForFactShow.FormShow(Sender: TObject);
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  i, LastCount, accountingTypeCode: Integer;
  SCSeal2ENWorkOrderBytList: SCSeal2ENWorkOrderBytShortList;
begin
  SetGridHeaders(SCSeal2ENWorkOrderBytHeaders, sgSCSeal2ENWorkOrderByt.ColumnHeaders);

  if workOrderBytCode = LOW_INT then
    raise Exception.Create('Не задан код Сменного задания!');

  case sealTypeCode of
    SCSEALTYPE_SEAL: accountingTypeCode := TK_ACCOUNTINGTYPE_SEAL;
    SCSEALTYPE_IMP:  accountingTypeCode := TK_ACCOUNTINGTYPE_IMP;
    SCSEALTYPE_HOLO: accountingTypeCode := TK_ACCOUNTINGTYPE_HOLO
    else
      raise Exception.Create('Не задан тип объекта (пломба/индикатор/голограмма)!');
  end;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

  SCSeal2ENWorkOrderBytList := TempSCSeal2ENWorkOrderByt.getWorkOrderBytItemsForSealsBinding(workOrderBytCode, accountingTypeCode);

  LastCount := High(SCSeal2ENWorkOrderBytList.list);

  if LastCount > -1 then
    sgSCSeal2ENWorkOrderByt.RowCount := LastCount + 2
  else
    sgSCSeal2ENWorkOrderByt.RowCount := 2;

{
        ( 'Код'
          ,'Коды enestimateitem'
          ,'Особ. рах. / № дог.'
          ,'ПІБ абонента'
          ,'ПІБ абонента' // название для передачи на сервер (скрытый столбец)
          //,'Матеріал у плані'
          ,'Кількість пломб у плані'
          ,'Прив''язано пломб'
        );
}

  with sgSCSeal2ENWorkOrderByt do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      //if SCSeal2ENWorkOrderBytList.list[i].sealRefCode <> Low(Integer) then
      //  Cells[0,i+1] := IntToStr(SCSeal2ENWorkOrderBytList.list[i].sealRefCode)
      //else
      Cells[0,i+1] := '';

      Cells[1,i+1] := SCSeal2ENWorkOrderBytList.list[i].estimateItemCodes;

      //Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber;
      if SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber <> '' then
        Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber
      else
        Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefContractNumberServices;

      Cells[3,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefCustomerNameFull;
      Cells[4,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefCustomerName;

      if SCSeal2ENWorkOrderBytList.list[i].estimateItemCountFact = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := SCSeal2ENWorkOrderBytList.list[i].estimateItemCountFact.DecimalString;

      if SCSeal2ENWorkOrderBytList.list[i].sealsCountFact = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealsCountFact.DecimalString;

      sgSCSeal2ENWorkOrderByt.RowCount := i + 2;
    end;

  sgSCSeal2ENWorkOrderByt.Row := 1;
end;

end.
